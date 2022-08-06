import 'package:flutter/material.dart';
import '../../../shared/shared_widget.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key, required this.nameController}) : super(key: key);
  TextEditingController nameController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            errorText: nameController.text.isEmpty
                ? "You Most Enter Your UserName"
                : null,
            labelText: "Full Name",
            labelStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 15),
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.grey,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.black),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            filled: true,
            fillColor: CustomWidgets().backgroundColor,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
