import 'package:flutter/material.dart';

import '../models/locacao.dart';
import '../utils/formatadores.dart';
import 'linha_resumo.dart';

/// Mostra todas as informações da locação.
/// É reaproveitado em DOIS lugares: no Card da tela e no AlertDialog.
class ResumoLocacao extends StatelessWidget {
  final Locacao locacao;

  const ResumoLocacao({super.key, required this.locacao});

  @override
  Widget build(BuildContext context) {
    final percentual = (locacao.percentualDesconto * 100).toStringAsFixed(0);
    final categoria = locacao.categoria;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LinhaResumo('Veículo', locacao.veiculo.nome),
        LinhaResumo('Dias', '${locacao.dias}'),
        LinhaResumo('Seguro', simNao(locacao.seguro)),
        LinhaResumo('GPS', simNao(locacao.gps)),
        LinhaResumo('Motorista adicional', simNao(locacao.motoristaExtra)),
        const Divider(),
        LinhaResumo('Valor bruto', moeda(locacao.valorBruto)),
        LinhaResumo(
          'Desconto ($percentual%)',
          '- ${moeda(locacao.valorDesconto)}',
          cor: Colors.green,
        ),
        LinhaResumo('Valor final', moeda(locacao.valorFinal), destaque: true),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: Chip(
            avatar: Icon(Icons.workspace_premium, color: categoria.cor),
            label: Text(
              categoria.nome,
              style: TextStyle(
                color: categoria.cor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
