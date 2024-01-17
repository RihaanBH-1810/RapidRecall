import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class bigCard extends StatelessWidget {
  bigCard({super.key, required String text}) : _text = text;
  final String _text;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: TeXView(
                  renderingEngine: TeXViewRenderingEngine.katex(),
                  child: TeXViewDocument(_text),
                  style: TeXViewStyle.fromCSS("text-align: center"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Tap to flip the card",
              style: TextStyle(
                  fontSize: 10, color: Color.fromARGB(249, 189, 187, 187)),
            ),
          ),
        ],
      ),
    );
  }
}
