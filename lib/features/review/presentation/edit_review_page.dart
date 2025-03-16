import 'package:ev_planner/shared/theme/ev_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EditReviewPage extends ConsumerStatefulWidget {
  const EditReviewPage(
      {super.key, required this.reviewId, required this.previousComment});

  final String reviewId;
  final String previousComment;

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
      isTextChanged = _controller.text != widget.previousComment;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_checkIfTextChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            // TextBox for editing the comment
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Edit Comment',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Cancel button
                    ElevatedButton(
                      onPressed: () {
                        _controller.text = widget.previousComment;
                        setState(() {
                          isTextChanged = false;
                        });
                      },
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 10),
                    // Update button
                    ElevatedButton(
                      onPressed: isTextChanged
                          ? () {
                              //TODO implement update
                              // Handle update logic here
                              print("Comment updated: ${_controller.text}");
                            }
                          : null,
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
