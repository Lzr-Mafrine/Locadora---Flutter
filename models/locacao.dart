import 'categoria_cliente.dart';
import 'veiculo.dart';

/// Guarda as escolhas do cliente e faz TODOS os cálculos.
/// Fica fora da tela de propósito: a regra de negócio não depende de widget,
/// então fica fácil de ler, testar e reaproveitar.
class Locacao {
  final Veiculo veiculo;
  final int dias;
  final bool seguro;
  final bool gps;
  final bool motoristaExtra;

  const Locacao({
    required this.veiculo,
    required this.dias,
    required this.seguro,
    required this.gps,
    required this.motoristaExtra,
  });

  // Preços fixos
  static const double valorSeguroDia = 40;
  static const double valorGpsDia = 15;
  static const double taxaMotorista = 100;

  /// 1º passo: veículo + seguro + GPS (por dia)
  double get valorDiario =>
      veiculo.diaria + (seguro ? valorSeguroDia : 0) + (gps ? valorGpsDia : 0);

  /// 2º e 3º passos: diário × dias + taxa do motorista adicional
  double get valorBruto =>
      valorDiario * dias + (motoristaExtra ? taxaMotorista : 0);

  /// Desconto por fidelidade (confere do maior para o menor!)
  double get percentualDesconto {
    if (dias >= 15) return 0.10;
    if (dias >= 7) return 0.05;
    return 0;
  }

  double get valorDesconto => valorBruto * percentualDesconto;

  double get valorFinal => valorBruto - valorDesconto;

  CategoriaCliente get categoria => CategoriaCliente.porValor(valorFinal);
}
