import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:flutter_application_1/models/flash_card.dart';
import 'package:flutter_application_1/utils/methods.dart';
import 'package:flutter_tex/flutter_tex.dart';

class QuestionTile extends StatelessWidget {
  const QuestionTile({
    super.key,
    required question,
    required answer,
    required deck,
    required index,
    required subject,
  })  : _question = question,
        _answer = answer,
        _deck = deck,
        _index = index,
        _subject = subject;

  final _question;
  final _answer;
  final List<flashCard> _deck;
  final _index;
  final _subject;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          loadSession(
              context: context,
              question: _question,
              answer: _answer,
              deck: _deck,
              index: _index,
              subject: _subject);
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: wht),
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                    child: Center(
                        child: Stack(
                  children: [
                    TeXView(
                      renderingEngine: TeXViewRenderingEngine.katex(),
                      child: TeXViewDocument(_question),
                      style: TeXViewStyle.fromCSS("text-align: center"),
                    ),
                    GestureDetector(
                      onTap: () {
                        loadSession(
                            context: context,
                            question: _question,
                            answer: _answer,
                            deck: _deck,
                            index: _index,
                            subject: _subject);
                      },
                    ),
                  ],
                ))))));
  }
}
