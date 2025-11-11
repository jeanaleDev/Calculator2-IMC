import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Ícone Masculino
        GestureDetector(
          onTap: () {
            setState(() {
              selectedGender = 'Masculino';
            });
          },
          child: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              color: selectedGender == 'Masculino'
                  ? Colors.blue.shade100
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6),
              ],
              border: Border.all(
                color: selectedGender == 'Masculino'
                    ? Colors.blue
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.male, size: 60, color: Colors.blue),
                SizedBox(height: 8),
                Text(
                  "Masculino",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),

        // Ícone Feminino
        GestureDetector(
          onTap: () {
            setState(() {
              selectedGender = 'Feminino';
            });
          },
          child: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              color: selectedGender == 'Feminino'
                  ? Colors.pink.shade100
                  : Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6),
              ],
              border: Border.all(
                color: selectedGender == 'Feminino'
                    ? Colors.pink
                    : Colors.transparent,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.female, size: 60, color: Colors.pink),
                SizedBox(height: 8),
                Text(
                  "Feminino",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
