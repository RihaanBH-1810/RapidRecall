import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/home_page/subject_tile.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:flutter_application_1/data/subjects.dart';
import 'package:flutter_application_1/models/flash_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _subjects = [];
  final List<List<flashCard>> _subject_list = [];
  @override
  initState() {
    for (var f in subs) {
      if (!_subjects.contains(f.subject_name)) {
        _subjects.add(f.subject_name);
        _subject_list.add(f.subject_question_deck);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("FlashCards"),
        toolbarHeight: size.height * 0.15,
        leading: Container(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(size.width, 58.0),
          ),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04),
        child: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: blu,
            expandedHeight: size.height * 0.4,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                  padding: EdgeInsets.all(size.width * 0.1),
                  child: Image.asset("assets/images/background.png")),
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  childCount: _subjects.length,
                  (context, index) => subjectTile(
                        subject: _subjects[index],
                        subject_deck: _subject_list[index],
                      )),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ))
        ]),
      ),
    );
  }
}
