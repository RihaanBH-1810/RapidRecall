import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:flutter_application_1/utils/methods.dart';

class subjectTile extends StatelessWidget {
  const subjectTile({
    super.key,
    required subject,
    required subject_deck,
  })  : _subject = subject,
        _subject_deck = subject_deck;

  final _subject;
  final _subject_deck;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          loadSession2(
              context: context, subject: _subject, subject_deck: _subject_deck);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: wht),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(child: Text(_subject)),
          ),
        ));
  }
}
