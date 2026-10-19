import 'package:flutter/material.dart';

import '../models/locacao.dart';
import '../models/veiculo.dart';
import '../utils/formatadores.dart';
import '../widgets/opcao_checkbox.dart';
import '../widgets/resumo_locacao.dart';
import '../widgets/titulo_secao.dart';

class LocacaoPage extends StatefulWidget {
  const LocacaoPage({super.key});

  @override
  State<LocacaoPage> createState() => _LocacaoPageState();
}

class _LocacaoPageState extends State<LocacaoPage> {
  // Estado: o que o usuário escolheu
  Veiculo _veiculo = Veiculo.economico;
  bool _seguro = false;
  bool _gps = false;
  bool _motoristaExtra = false;
  double _dias = 1; // Slider trabalha com double

  /// Monta o objeto Locacao com as escolhas atuais.
  /// Todos os cálculos acontecem dentro dele.
  Locacao get _locacao => Locacao(
        veiculo: _veiculo,
        dias: _dias.round(),
        seguro: _seguro,
        gps: _gps,
        motoristaExtra: _motoristaExtra,
      );

  void _finalizarReserva() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Confirmar reserva'),
        content: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 280),
            child: ResumoLocacao(locacao: _locacao), // widget reaproveitado
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Reserva realizada com sucesso!')),
              );
            },
            child: const Text('Confirmar Reserva'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locacao = _locacao;

    return Scaffold(
      appBar: AppBar(title: const Text('Locadora de Carros')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Veículo
          const TituloSecao('Escolha o veículo'),
          const SizedBox(height: 8),
          SegmentedButton<Veiculo>(
            segments: Veiculo.values
                .map((v) => ButtonSegment<Veiculo>(
                      value: v,
                      label: Text(v.rotuloCurto),
                      icon: const Icon(Icons.directions_car),
                    ))
                .toList(),
            selected: {_veiculo},
            onSelectionChanged: (s) => setState(() => _veiculo = s.first),
          ),
          const SizedBox(height: 4),
          Text('Diária: ${moeda(_veiculo.diaria)}'),
          const SizedBox(height: 16),

          // 2 e 3. Seguro e GPS (mesmo widget, dados diferentes)
          OpcaoCheckbox(
            titulo: 'Seguro Completo (+ ${moeda(Locacao.valorSeguroDia)}/dia)',
            valor: _seguro,
            onChanged: (v) => setState(() => _seguro = v),
          ),
          OpcaoCheckbox(
            titulo: 'GPS (+ ${moeda(Locacao.valorGpsDia)}/dia)',
            valor: _gps,
            onChanged: (v) => setState(() => _gps = v),
          ),

          // 4. Motorista adicional
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Motorista Adicional (taxa fixa ${moeda(Locacao.taxaMotorista)})',
            ),
            value: _motoristaExtra,
            onChanged: (v) => setState(() => _motoristaExtra = v),
          ),
          const SizedBox(height: 8),

          // 5. Dias
          TituloSecao('Quantidade de dias: ${locacao.dias}'),
          Slider(
            value: _dias,
            min: 1,
            max: 30,
            divisions: 29,
            label: '${locacao.dias}',
            onChanged: (v) => setState(() => _dias = v),
          ),
          const SizedBox(height: 8),

          // 8. Resumo
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Resumo da Locação',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  ResumoLocacao(locacao: locacao), // mesmo widget do dialog
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 9. Finalizar
          FilledButton.icon(
            onPressed: _finalizarReserva,
            icon: const Icon(Icons.check_circle),
            label: const Text('Finalizar Reserva'),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}
