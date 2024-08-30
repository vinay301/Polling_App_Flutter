import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final bool hasVoted;
  final VoidCallback? onPressed;

  const SubmitButton({
    super.key,
    required this.hasVoted,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !hasVoted,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF3ee577),
              Color(0xFF42fcdb),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: GestureDetector(
          onTap: onPressed,
          child: const Center(
            child: Text(
              'Submit vote!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
