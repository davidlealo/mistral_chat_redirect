import 'package:flutter/material.dart';

class EventoABPScreen extends StatelessWidget {
  const EventoABPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Evento ABP')),
      body: const Center(
        child: Text(
          'Bienvenido a la pantalla del Evento ABP.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
