import 'package:chatbot/deimo_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DeimosDialogflowApp());
}

class DeimosDialogflowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deimos Dialogflow Integration',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false, 
      home: DeimosAppHome(),
    );
  }
}