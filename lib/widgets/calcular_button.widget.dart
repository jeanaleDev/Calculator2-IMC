import 'package:flutter/material.dart';

class CalcularButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CalcularButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 30),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff1a237e),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),

          onPressed: onPressed,
          child: Text(
            "Calcular",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
