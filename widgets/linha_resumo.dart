import 'package:flutter/material.dart';

/// Uma linha "Rótulo ........ Valor" do resumo.
class LinhaResumo extends StatelessWidget {
  final String rotulo;
  final String valor;
  final bool destaque; // true = fonte maior e negrito
  final Color? cor;

  const LinhaResumo(
    this.rotulo,
    this.valor, {
    super.key,
    this.destaque = false,
    this.cor,
  });

  @override
  Widget build(BuildContext context) {
    final estilo = TextStyle(
      fontSize: destaque ? 18 : 14,
      fontWeight: destaque ? FontWeight.bold : FontWeight.normal,
      color: cor,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(rotulo, style: estilo),
          const SizedBox(width: 16),
          Text(valor, style: estilo),
        ],
      ),
    );
  }
}
