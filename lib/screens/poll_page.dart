import 'package:flutter/material.dart';
import 'package:polling_app/screens/components/poll_header.dart';
import 'package:polling_app/screens/components/poll_options_list.dart';
import 'package:polling_app/screens/components/submit_button.dart';

class PollPage extends StatefulWidget {
  const PollPage({super.key});
  @override
  State<PollPage> createState() => _PollPageState();
}

class _PollPageState extends State<PollPage> {
  int? _selectedOption;
  bool _hasVoted = false;
  final List<double> _votePercentages = [0.52, 0.14, 0.34];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: _hasVoted
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF3ee577),
                      Color(0xFF42fcdb),
                    ],
                  )
                : null,
            color: _hasVoted ? null : Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              PollHeader(
                hasVoted: _hasVoted,
                onBackPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(
                height: 60,
              ),
              Expanded(
                child: PollOptionsList(
                  selectedOption: _selectedOption,
                  hasVoted: _hasVoted,
                  votePercentages: _votePercentages,
                  onOptionSelected: (index) {
                    setState(() {
                      _selectedOption = index;
                    });
                  },
                ),
              ),
              const Spacer(),
              SubmitButton(
                hasVoted: _hasVoted,
                onPressed: _selectedOption == null
                    ? null
                    : () {
                        setState(() {
                          _hasVoted = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Thank you for your vote!'),
                          ),
                        );
                      },
              ),
              if (_hasVoted)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'Thank you for your response!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
