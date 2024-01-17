import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/themes.dart';
import 'package:flutter_application_1/notifiers/flash_cards_notifier.dart';
import 'package:flutter_application_1/notifiers/subject_notifier.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FlashCardsNotifier()),
    ChangeNotifierProvider(create: (__) => SubjectNotifier())
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flashcards App",
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
