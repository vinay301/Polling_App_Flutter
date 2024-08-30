import 'package:flutter/material.dart';

class PollOption extends StatelessWidget {
  final String optionText;
  final bool isSelected;
  final bool isVoted;
  final double votePercentage;
  final VoidCallback? onTap;

  const PollOption({
    super.key,
    required this.optionText,
    required this.isSelected,
    required this.isVoted,
    required this.votePercentage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isVoted && isSelected
                ? Colors.green.shade800
                : Colors.grey.shade300,
            width: isVoted && isSelected ? 3 : 1,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            if (!isVoted && isSelected)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 5,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF3ee577),
                        Color(0xFF42fcdb),
                      ],
                    ),
                  ),
                ),
              ),
            if (isVoted)
              Positioned.fill(
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: votePercentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x993EE577),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text(
                      optionText,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                  if (isVoted)
                    Text(
                      '${(votePercentage * 100).toStringAsFixed(0)}%',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:
                              isVoted ? Colors.green.shade800 : Colors.black),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
