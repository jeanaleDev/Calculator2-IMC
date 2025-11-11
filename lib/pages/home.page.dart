import 'package:flutter/material.dart';
import 'package:imcwebclone/widgets/calcular_button.widget.dart';
import 'package:imcwebclone/widgets/gender_selector.widget.dart';
import 'package:imcwebclone/widgets/input_field.dart';
import 'package:imcwebclone/widgets/resultado.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pesoctrl = TextEditingController();
  final alturactrl = TextEditingController();

  double? imcResultado;
  String classificacao = "";
  Color corResultado = Colors.pink;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calcule seu IMC",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff1a237e),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InputField(label: "Peso (kg)", controller: pesoctrl),
                InputField(label: "Altura (m)", controller: alturactrl),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Gênero",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 10),
            GenderSelector(),
            const SizedBox(height: 30),
            if (imcResultado != null)
              Resultado(
                classificacao: classificacao,
                imc: imcResultado!,
                cor: corResultado,
              ),

            const SizedBox(height: 30),
            CalcularButton(onPressed: calcularIMC),
          ],
        ),
      ),
    );
  }

  void calcularIMC() {
    double? peso = double.tryParse(pesoctrl.text.replaceAll(',', '.'));
    double? altura = double.tryParse(alturactrl.text.replaceAll(',', '.'));

    if (peso != null && altura != null && altura > 0) {
      double imc = peso / (altura * altura);
      Color cor = corResultado;
      String classificacaoLocal = "";

      if (imc < 18.5) {
        classificacaoLocal = "Abaixo do peso!!!";
        cor = Colors.yellow;
      } else if (imc >= 18.5 && imc < 24.9) {
        classificacaoLocal = "Peso normal!";
        cor = Colors.green;
      } else if (imc >= 24.9 && imc < 29.9) {
        classificacaoLocal = "Sobrepeso!!!";
        cor = Colors.orange;
      } else if (imc < 34.9) {
        classificacaoLocal = "Obesidade grau 1";
        cor = Colors.deepOrange;
      } else if (imc < 39.9) {
        classificacaoLocal = "Obesidade grau 2";
        cor = Colors.redAccent;
      } else {
        classificacaoLocal = "Obesidade grau 3";
        cor = Colors.red;
      }

      setState(() {
        imcResultado = imc;
        classificacao = classificacaoLocal;
        corResultado = cor;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Preencha peso e altura corretamente!")),
      );
    }
  }
}
