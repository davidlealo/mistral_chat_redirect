import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mistral_chat_redirect/screens/chat_screen.dart';

void main() {
  testWidgets('Chat screen initial state test', (WidgetTester tester) async {
    // Construir la pantalla de chat.
    await tester.pumpWidget(MaterialApp(home: ChatScreen()));

    // Verificar que la pantalla no tiene mensajes al inicio.
    expect(find.byType(TextField), findsOneWidget); // Verifica que hay un campo de texto.
    expect(find.byType(ListView), findsOneWidget); // Verifica que hay una lista para los mensajes.
    expect(find.text('Escribe tu mensaje...'), findsOneWidget); // Placeholder del campo de texto.
  });

  testWidgets('Sending a message adds it to the chat', (WidgetTester tester) async {
    // Construir la pantalla de chat.
    await tester.pumpWidget(MaterialApp(home: ChatScreen()));

    // Encuentra el campo de texto e ingresa un mensaje.
    final textField = find.byType(TextField);
    final sendButton = find.byIcon(Icons.send);

    await tester.enterText(textField, 'Hola, Mistral!');
    await tester.tap(sendButton);

    // Espera a que la pantalla se actualice.
    await tester.pump();

    // Verifica que el mensaje ingresado ahora aparece en la pantalla.
    expect(find.text('Hola, Mistral!'), findsOneWidget);
  });
}
