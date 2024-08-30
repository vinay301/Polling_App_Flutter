import 'package:flutter/material.dart';
import 'package:polling_app/models/poll_model.dart';
import 'poll_option.dart';

class PollOptionsList extends StatelessWidget {
  final int? selectedOption;
  final bool hasVoted;
  final List<double> votePercentages;
  final ValueChanged<int> onOptionSelected;

  const PollOptionsList({
    super.key,
    required this.selectedOption,
    required this.hasVoted,
    required this.votePercentages,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16.0, // Horizontal spacing between options
      runSpacing: 8.0, // Vertical spacing between rows
      children: List.generate(
        pollOptions.length,
        (index) => SizedBox(
          width: MediaQuery.of(context).size.width -
              32, // Full width minus padding
          child: PollOption(
            optionText: pollOptions[index],
            isSelected: selectedOption == index,
            isVoted: hasVoted,
            votePercentage: votePercentages[index],
            onTap: !hasVoted ? () => onOptionSelected(index) : null,
          ),
        ),
      ),
    );
  }
}
