import 'package:flutter/material.dart';
import '../api/api_service.dart';
import '../models/message.dart';
import '../widgets/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ApiService apiService = ApiService();
  final TextEditingController controller = TextEditingController();
  final List<Message> messages = [];
  bool isLoading = false;

  void sendMessage() async {
    final userMessage = controller.text;
    if (userMessage.isEmpty) return;

    setState(() {
      messages.add(Message(content: userMessage, isUser: true));
      controller.clear();
      isLoading = true;
    });

    try {
      final botResponse = await apiService.sendMessage(userMessage);
      setState(() {
        messages.add(Message(content: botResponse, isUser: false));
      });
    } catch (e) {
      setState(() {
        messages.add(Message(content: "Error: No se pudo procesar tu mensaje.", isUser: false));
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mistral Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ChatBubble(message: message);
              },
            ),
          ),
          if (isLoading) CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Escribe tu mensaje...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
