import 'package:flutter/material.dart';
import '../models/flash_card.dart';

class SubjectNotifier extends ChangeNotifier {
  String subject = " ";
  List<flashCard> subject_deck = [];

  setSubject({required String subject, required List<flashCard> subject_deck}) {
    this.subject = subject;
    this.subject_deck = subject_deck;
    notifyListeners();
  }
}
