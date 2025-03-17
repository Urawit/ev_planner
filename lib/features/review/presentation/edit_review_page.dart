import 'package:ev_planner/shared/theme/ev_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/widgets.dart';
import '../../navigation/presentation/logic/station_detail/station_detail_provider.dart';
import 'logic/logic.dart';

class EditReviewPage extends ConsumerStatefulWidget {
  const EditReviewPage(
      {super.key,
      required this.reviewId,
      required this.previousComment,
      required this.stationId});

  final String reviewId;
  final String previousComment;
  final String stationId;

  @override
  EditReviewPageState createState() => EditReviewPageState();
}

class EditReviewPageState extends ConsumerState<EditReviewPage> {
  late TextEditingController _controller;
  bool isTextChanged = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.previousComment);
    _controller.addListener(_checkIfTextChanged);
  }

  void _checkIfTextChanged() {
    setState(() {
      isTextChanged =
          _controller.text != widget.previousComment && _controller.text != '';
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_checkIfTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void editReview() {
    ref
        .read(editReviewProvider.notifier)
        .editReview(reviewId: widget.reviewId, comment: _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(editReviewProvider, (previous, next) {
      next.whenOrNull(
        success: () {
          context.pop();
          context.pop();
          ref
              .read(stationDetailProvider.notifier)
              .getStationDetail(stationId: widget.stationId);
          showFlushbar(
            context: context,
            title: 'Edit Review Successful',
            message: 'Your review has been successfully updated.',
            backgroundColor: Colors.green,
          );
        },
        error: (_) {
          errorPopupWidget(
            context: context,
            errorMessage: 'Edit comment have failed, Please retry again',
            buttonLabel: 'retry',
            onRetry: editReview,
          );
        },
      );
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 16, right: 16),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: context.pop,
                ),
                const SizedBox(width: 120),
                Text(
                  'Edit',
                  style: EVDesignSystem.textStyles.headline2,
                ),
              ],
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Edit Comment',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                labelStyle: const TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        side: const BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        _controller.text = widget.previousComment;
                        setState(() {
                          isTextChanged = false;
                        });
                      },
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isTextChanged ? Colors.blue : Colors.grey,
                        foregroundColor: Colors.white,
                        side: BorderSide(
                            color: isTextChanged ? Colors.blue : Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: isTextChanged ? editReview : null,
                      child: const Text('Update'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
