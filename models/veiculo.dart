/// Os 3 tipos de veículo disponíveis na locadora.
/// Cada valor do enum já carrega seu nome e o preço da diária.
enum Veiculo {
  economico('Econômico', 'Carro Econômico', 120),
  suv('SUV', 'SUV', 180),
  luxo('Luxo', 'Carro de Luxo', 300);

  final String rotuloCurto; // texto do botão (SegmentedButton)
  final String nome; // nome completo (resumo)
  final double diaria;

  const Veiculo(this.rotuloCurto, this.nome, this.diaria);
}
