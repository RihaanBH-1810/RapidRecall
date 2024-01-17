import 'package:flutter/material.dart';
import 'package:flutter_application_1/notifiers/flash_cards_notifier.dart';
import 'package:flutter_application_1/notifiers/subject_notifier.dart';
import 'package:flutter_application_1/pages/flash_card_view.dart';
import 'package:flutter_application_1/pages/subject_view.dart';
import 'package:provider/provider.dart';
import '../models/flash_card.dart';

loadSession(
    {required BuildContext context,
    required String question,
    required String answer,
    required List<flashCard> deck,
    required int index,
    required String subject}) {
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => FlashCardsPage()));
  Provider.of<FlashCardsNotifier>(context, listen: false).setQuestion(
      question: question,
      answer: answer,
      deck: deck,
      index: index,
      subject: subject);
}

loadSession2(
    {required BuildContext context,
    required String subject,
    required List<flashCard> subject_deck}) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => SubjectPage()));
  Provider.of<SubjectNotifier>(context, listen: false)
      .setSubject(subject: subject, subject_deck: subject_deck);
}
