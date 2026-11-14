import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../widgets/chat_app_bar.dart';
import '../widgets/chat_background.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_input_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Message> messages = [
    Message(
      text: 'Hey! Have you ever thought about how random moments can sometimes turn into the best memories? It\'s like the universe loves to surprise us when we least expect it!',
      isMe: false,
      time: '10:00 AM',
    ),
    Message(
      text: 'Hey! Have you ever thought about how random moments can sometimes turn into the best memories? It\'s like the universe loves to surprise us when we least expect it!',
      isMe: true,
      time: '10:01 AM',
    ),
  ];

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add(
        Message(
          text: text,
          isMe: true,
          time: TimeOfDay.now().format(context),
        ),
      );
      _controller.clear();
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppBar(),
      body: ChatBackground(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(message: messages[index]);
                },
              ),
            ),
            ChatInputBar(
              controller: _controller,
              onSend: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
