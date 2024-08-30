import 'package:flutter/material.dart';
import 'poll_question.dart';

class PollHeader extends StatelessWidget {
  final bool hasVoted;
  final VoidCallback onBackPressed;

  const PollHeader({
    super.key,
    required this.hasVoted,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          BackButton(
            color: hasVoted ? Colors.white : Colors.grey,
            onPressed: onBackPressed,
          ),
          const SizedBox(height: 16),
          PollQuestion(hasVoted: hasVoted),
        ],
      ),
    );
  }
}
