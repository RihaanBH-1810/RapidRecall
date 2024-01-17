import 'package:flutter_application_1/data/flashcards.dart';
import 'package:flutter_application_1/models/subject.dart';

final List<subject> subs = [
  subject(subject_name: "Physics", subject_question_deck: PhysicsFlashCards),
  subject(
      subject_name: "Chemistry", subject_question_deck: ChemistryFlashCards),
  subject(subject_name: "Math", subject_question_deck: MathFlashCards),
  subject(subject_name: "Java", subject_question_deck: JavaFlashCards),
  subject(subject_name: "Mechanics", subject_question_deck: MechanicsFlashCards)
];
