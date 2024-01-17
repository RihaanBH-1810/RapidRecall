import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/subject_page/question_tile.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:flutter_application_1/notifiers/subject_notifier.dart';
import 'package:flutter_application_1/pages/add_flash_card.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:provider/provider.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({super.key});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<SubjectNotifier>(
      builder: (__, notifier, _) => Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                        (route) => false);
                  },
                  icon: Icon(Icons.home_outlined)),
            ],
            backgroundColor: wht,
            title: Text(notifier.subject),
            toolbarHeight: size.height * 0.15,
            leading: Container(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(size.width, 58.0),
              ),
            ),
          ),
          body: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.04, right: size.width * 0.04),
              child: CustomScrollView(slivers: [
                SliverAppBar(
                  backgroundColor: blu,
                  expandedHeight: size.height * 0.4,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                        padding: EdgeInsets.all(size.width * 0.1),
                        child: Image.asset(
                            "assets/images/${notifier.subject}.png")),
                  ),
                ),
                SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                        childCount: notifier.subject_deck.length,
                        (context, index) => QuestionTile(
                              question: notifier.subject_deck[index].question,
                              answer: notifier.subject_deck[index].answer,
                              deck: notifier.subject_deck,
                              index: index,
                              subject: notifier.subject,
                            )),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                    ))
              ])),
          floatingActionButton: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddFlashCardsPage(
                            subject_name: notifier.subject,
                          )),
                  (route) => false);
            },
            child: Material(
              elevation: 15,
              borderRadius: BorderRadius.all(Radius.circular(28)),
              child: Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ),
          )),
    );
  }
}
