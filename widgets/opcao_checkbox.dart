import 'package:flutter/material.dart';

/// CheckBox reutilizável (usado no Seguro e no GPS).
class OpcaoCheckbox extends StatelessWidget {
  final String titulo;
  final bool valor;
  final ValueChanged<bool> onChanged;

  const OpcaoCheckbox({
    super.key,
    required this.titulo,
    required this.valor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(titulo),
      value: valor,
      onChanged: (v) => onChanged(v ?? false),
    );
  }
}
