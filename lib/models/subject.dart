import 'package:flutter_application_1/models/flash_card.dart';

class subject {
  final String subject_name;
  final List<flashCard> subject_question_deck;
  subject({required this.subject_name, required this.subject_question_deck});
}
