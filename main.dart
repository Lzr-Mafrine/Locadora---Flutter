import 'package:flutter/material.dart';

import 'pages/locacao_page.dart';

void main() => runApp(const LocadoraApp());

class LocadoraApp extends StatelessWidget {
  const LocadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locadora de Carros',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const LocacaoPage(),
    );
  }
}
