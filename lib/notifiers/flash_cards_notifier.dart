import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/flash_card.dart';

class FlashCardsNotifier extends ChangeNotifier {
  String question = "";
  String answer = "";
  List<flashCard> deck = [];
  int index = 0;
  String subject = "";
  setQuestion(
      {required String question,
      required String answer,
      required List<flashCard> deck,
      required int index,
      required String subject}) {
    this.question = question;
    this.answer = answer;
    this.deck = deck;
    this.index = index;
    this.subject = subject;
    notifyListeners();
  }
}
