import 'package:flutter/material.dart';

class PollQuestion extends StatelessWidget {
  final bool hasVoted;

  const PollQuestion({super.key, required this.hasVoted});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Do you think this is\n",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: hasVoted ? Colors.white : Colors.black,
                ),
              ),
              TextSpan(
                text: "a good design for a poll?",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: hasVoted ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 16),
        _buildDecorativeDots(),
      ],
    );
  }

  Widget _buildDecorativeDots() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          3,
          (index) => Container(
            width: 6,
            height: 6,
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: hasVoted ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
