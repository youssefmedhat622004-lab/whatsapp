import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(const WhatsAppApp());
}

class WhatsAppApp extends StatelessWidget {
  const WhatsAppApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: ChatScreen(),
    );
  }
}
