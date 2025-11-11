import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final double imc;
  final String classificacao;
  final Color cor;
  const Resultado({
    super.key,
    required this.classificacao,
    required this.imc,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Seu IMC é",
          style: TextStyle(color: Colors.black54, fontSize: 16),
        ),
        Text(
          imc.toStringAsFixed(2),
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xff1a237e),
          ),
        ),
        Text(
          classificacao,
          style: TextStyle(
            color: cor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
