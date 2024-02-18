import 'package:flutter/material.dart';

import 'read_view.dart';
import 'word_screen.dart';

void main() {
  runApp(const IlkokulUygulama());
}

class IlkokulUygulama extends StatelessWidget {
  const IlkokulUygulama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReadView()
    );
  }
}

