import 'package:flutter/material.dart';
import '../api/api_service.dart';
import 'admin_screen.dart';
import 'proyectos_abp_screen.dart';
import 'evento_abp_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ApiService apiService = ApiService();
  final TextEditingController controller = TextEditingController();
  final List<Map<String, String>> messages = [];

  void sendMessage() async {
    final userMessage = controller.text;

    if (userMessage.isEmpty) return;

    // Añadir el mensaje del usuario al chat
    setState(() {
      messages.add({"role": "user", "content": userMessage});
      controller.clear();
    });

    try {
      // Llamar a la API
      final String response = await apiService.sendMessage(userMessage);

      // Redirigir a la pantalla correspondiente según la respuesta exacta
      switch (response.trim()) {
        case "ADMINISTRADOR INTELIGENTE DE COLEGIOS":
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AdminScreen()));
          break;

        case "DESARROLLO PROYECTOS ABP":
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProyectosABPScreen()));
          break;

        case "EVENTO ABP":
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EventoABPScreen()));
          break;

        default:
          // Mensaje si no se reconoce ninguna opción
          setState(() {
            messages.add({
              "role": "bot",
              "content":
                  "No se identificó una opción válida en la respuesta: $response"
            });
          });
      }
    } catch (e) {
      // Manejar errores de la API
      setState(() {
        messages.add({
          "role": "bot",
          "content": "Error al comunicarse con la API: ${e.toString()}"
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUser = message['role'] == "user";
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(message['content']!),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Escribe tu mensaje...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
