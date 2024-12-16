import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/chat_screen.dart';

Future<void> main() async {
  await dotenv.load(); // Cargar el archivo .env
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mistral Chat Redirect',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ChatScreen(), // Pantalla principal
    );
  }
}
