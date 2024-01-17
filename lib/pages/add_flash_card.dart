import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:flutter_application_1/data/flashcards.dart';
import 'package:flutter_application_1/models/flash_card.dart';
import 'package:flutter_application_1/pages/subject_view.dart';
import 'package:flutter_application_1/utils/methods.dart';

class AddFlashCardsPage extends StatefulWidget {
  const AddFlashCardsPage({Key? key, required String subject_name})
      : subjectName = subject_name;

  final String subjectName;

  @override
  State<AddFlashCardsPage> createState() =>
      _AddFlashCardsPageState(subjectName);
}

class _AddFlashCardsPageState extends State<AddFlashCardsPage> {
  final String _subjectName;
  final questionTextController = TextEditingController();
  final answerTextController = TextEditingController();

  _AddFlashCardsPageState(this._subjectName);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String question = "";
    String answer = "";

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SubjectPage()),
                      (route) => false);
                },
                icon: Icon(Icons.cancel_outlined)),
          ],
          backgroundColor: wht,
          title: Text("New FlashCard"),
          toolbarHeight: size.height * 0.15,
          leading: Container(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(size.width, 58.0),
            ),
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            height: 350,
            child: FlipCard(
              front: Card(
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: questionTextController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "question",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Tap to flip the card",
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(249, 189, 187, 187)),
                      ),
                    ),
                  ],
                ),
              ),
              back: Card(
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: answerTextController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "answer",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Tap to flip the card",
                        style: TextStyle(
                            fontSize: 10,
                            color: Color.fromARGB(249, 189, 187, 187)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            question = questionTextController.text;
            answer = answerTextController.text;
            subjectFlashCards[_subjectName] ??= [];
            subjectFlashCards[_subjectName]
                ?.add(flashCard(question: question, answer: answer));
            loadSession2(
                context: context,
                subject: _subjectName,
                subject_deck: subjectFlashCards[_subjectName] ?? []);
          },
          child: Material(
            elevation: 15,
            borderRadius: BorderRadius.all(Radius.circular(28)),
            child: Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: const Icon(
                Icons.done,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ));
  }
}
