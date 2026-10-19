import 'package:flutter/material.dart';

/// Título em negrito usado nas seções da tela.
class TituloSecao extends StatelessWidget {
  final String texto;

  const TituloSecao(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
