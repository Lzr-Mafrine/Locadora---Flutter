/// Transforma 1234.5 em "R$ 1.234,50".
String moeda(double valor) {
  final partes = valor.toStringAsFixed(2).split('.');
  final inteiro = partes[0].replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (m) => '.',
  );
  return 'R\$ $inteiro,${partes[1]}';
}

/// Transforma true/false em "Sim"/"Não".
String simNao(bool valor) => valor ? 'Sim' : 'Não';
