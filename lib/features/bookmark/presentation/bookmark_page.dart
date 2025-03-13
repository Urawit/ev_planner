import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookmarkPage extends ConsumerStatefulWidget {
  const BookmarkPage({super.key});

  @override
  BookmarkPageState createState() => BookmarkPageState();
}

class BookmarkPageState extends ConsumerState<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Bookmark PAGE"),
    );
  }
}
