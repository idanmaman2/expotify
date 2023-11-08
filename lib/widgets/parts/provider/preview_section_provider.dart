import 'package:flutter/material.dart';

class PreviewSectionProvider extends ChangeNotifier {
  void nextScreen(context, nextScreen) {
    Navigator.push<void>(context,
        MaterialPageRoute<void>(builder: (BuildContext context) => nextScreen));
  }
}
