import 'package:flutter/material.dart';

class ProyectosABPScreen extends StatelessWidget {
  const ProyectosABPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Desarrollo de Proyectos ABP')),
      body: const Center(
        child: Text(
          'Bienvenido a la pantalla de Desarrollo de Proyectos ABP.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
