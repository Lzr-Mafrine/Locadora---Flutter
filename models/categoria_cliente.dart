import 'package:flutter/material.dart';

/// Desafio extra: categoria automática conforme o valor final.
enum CategoriaCliente {
  bronze('Cliente Bronze', Colors.brown),
  prata('Cliente Prata', Colors.blueGrey),
  ouro('Cliente Ouro', Color(0xFFFF8F00)),
  platinum('Cliente Platinum', Colors.deepPurple);

  final String nome;
  final Color cor;

  const CategoriaCliente(this.nome, this.cor);

  /// Descobre a categoria a partir do valor final da locação.
  static CategoriaCliente porValor(double valor) {
    if (valor <= 1000) return bronze;
    if (valor <= 3000) return prata;
    if (valor <= 5000) return ouro;
    return platinum;
  }
}
