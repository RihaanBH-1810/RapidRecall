import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/flash_cards_view_page/big_flashcard.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:flutter_application_1/data/flashcards.dart';
import 'package:flutter_application_1/notifiers/flash_cards_notifier.dart';
import 'package:flutter_application_1/pages/subject_view.dart';
import 'package:flutter_application_1/utils/methods.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tex/flutter_tex.dart';

class FlashCardsPage extends StatefulWidget {
  const FlashCardsPage({super.key});

  @override
  State<FlashCardsPage> createState() => _FlashCardsPageState();
}

class _FlashCardsPageState extends State<FlashCardsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashCardsNotifier>(
        builder: (__, notifier, _) => Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SubjectPage()),
                          (route) => false);
                    },
                    icon: Icon(Icons.cancel_outlined)),
              ],
              backgroundColor: wht,
              title: TeXView(
                renderingEngine: TeXViewRenderingEngine.katex(),
                child: TeXViewDocument(notifier.question),
                style: TeXViewStyle.fromCSS("text-align: center"),
              ),
              toolbarHeight: size.height * 0.15,
              leading: Container(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(size.width, 58.0),
                ),
              ),
            ),
            body: GestureDetector(
              onPanUpdate: (details) {
                if (details.delta.dx < 0) {
                  if (notifier.index != notifier.deck.length - 1) {
                    loadSession(
                        context: context,
                        question: notifier.deck[notifier.index + 1].question,
                        answer: notifier.deck[notifier.index + 1].answer,
                        deck: notifier.deck,
                        index: notifier.index + 1,
                        subject: notifier.subject);
                  } else {
                    loadSession(
                        context: context,
                        question: notifier.deck[0].question,
                        answer: notifier.deck[0].answer,
                        deck: notifier.deck,
                        index: 0,
                        subject: notifier.subject);
                  }
                }
                if (details.delta.dx > 0) {
                  if (notifier.index != 0) {
                    loadSession(
                        context: context,
                        question: notifier.deck[notifier.index - 1].question,
                        answer: notifier.deck[notifier.index - 1].answer,
                        deck: notifier.deck,
                        index: notifier.index - 1,
                        subject: notifier.subject);
                  } else {
                    loadSession(
                        context: context,
                        question:
                            notifier.deck[notifier.deck.length - 1].question,
                        answer: notifier.deck[notifier.deck.length - 1].answer,
                        deck: notifier.deck,
                        index: notifier.deck.length - 1,
                        subject: notifier.subject);
                  }
                }
              },
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 300,
                    height: 350,
                    child: FlipCard(
                        front: bigCard(text: notifier.question),
                        back: bigCard(
                          text: notifier.answer,
                        )),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.swipe_left,
                          size: 28,
                        ),
                        Text("  Swipe to change cards  "),
                        Icon(
                          Icons.swipe_right,
                          size: 28,
                        )
                      ],
                    ),
                  )
                ],
              )),
            ),
            floatingActionButton: GestureDetector(
              onTap: () {
                bool _deleted = false;
                showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return AlertDialog(
                      title: const Text('Please Confirm'),
                      content:
                          const Text('Are you sure to delete this flashCard?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            subjectFlashCards[notifier.subject]
                                ?.remove(notifier.deck[notifier.index]);
                            setState(() {
                              _deleted = true;
                            });
                            Navigator.of(context).pop(true);
                          },
                          child: const Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('No'),
                        )
                      ],
                    );
                  },
                ).then((value) {
                  if (_deleted && value == true) {
                    setState(() {
                      loadSession2(
                        context: context,
                        subject: notifier.subject,
                        subject_deck: subjectFlashCards[notifier.subject] ?? [],
                      );
                    });
                    print("deleted");
                  }
                });
              },
              child: Material(
                elevation: 15,
                borderRadius: BorderRadius.all(Radius.circular(28)),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(247, 232, 69, 66),
                  ),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            )));
  }
}
