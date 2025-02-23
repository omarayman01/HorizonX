import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key, required this.hintText, required this.obscure, required this.onChanged});
  String hintText;
   bool obscure;
   Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            obscureText: obscure,
            validator: (data) {
              if (data!.isEmpty) {
                return 'field is required';
              }
            },
            onChanged:onChanged,
            decoration:  InputDecoration(
              labelText: hintText,
              border: InputBorder.none,
              labelStyle: const TextStyle(color: Colors.white),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
