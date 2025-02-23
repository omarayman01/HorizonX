import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String label;
  final bool selected;

  const LanguageButton({
    super.key,
    required this.label,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: selected ? Colors.orange : Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: selected ? Colors.white : Colors.white,
        ),
      ),
    );
  }
}
