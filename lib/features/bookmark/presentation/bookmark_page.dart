import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/theme/ev_design_system.dart';
import '../../navigation/presentation/logic/logic.dart';
import '../../sign_in/presentation/logic/logic.dart';
import 'logic/get_bookmark_list_provider.dart';

class BookmarkPage extends ConsumerStatefulWidget {
  const BookmarkPage({super.key});

  @override
  BookmarkPageState createState() => BookmarkPageState();
}

class BookmarkPageState extends ConsumerState<BookmarkPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getBookmarkList();
    });
    super.initState();
  }

  void getBookmarkList() {
    final userContext = ref.read(userContextProvider);

    if (userContext == null) return;

    ref
        .read(getBookmarkListProvider.notifier)
        .getBookmarkList(userId: userContext.userId);
  }

  @override
  Widget build(BuildContext context) {
    final bookmarkState = ref.watch(getBookmarkListProvider);

    return Scaffold(
      backgroundColor: EVDesignSystem.colors.grey,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text('Saved Stations'),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: bookmarkState.whenOrNull(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (bookmarks) {
          if (bookmarks.isEmpty) {
            return const Center(
              child: Text(
                "No saved bookmarks.",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(25.0),
            itemCount: bookmarks.length,
            itemBuilder: (context, index) {
              final bookmark = bookmarks[index];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  onTap: () {
                    context.go('/navigation?stationId=${bookmark.stationId}');
                  },
                  contentPadding: const EdgeInsets.all(12.0),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookmark.stationName,
                            style: EVDesignSystem.textStyles.headline2,
                          ),
                          SizedBox(
                            width: 275,
                            child: Text(
                              bookmark.address,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: EVDesignSystem.textStyles.normal3,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 30,
                          ),
                          onPressed: () async {
                            await ref
                                .read(deleteBookmarkProvider.notifier)
                                .deleteBookmark(
                                    bookmarkId: bookmark.bookmarkId);
                            getBookmarkList();
                          },
                        ),
                      ),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          RatingBar.builder(
                            ignoreGestures: true,
                            initialRating: bookmark.averageRating,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 25,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 0.005),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (_) {},
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '(${bookmark.rateCount.toString()})',
                            style: EVDesignSystem.textStyles.normal3,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/plug_availability.png",
                            scale: 5.5,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${bookmark.availablePort.toString()} port available',
                            style: EVDesignSystem.textStyles.description2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
