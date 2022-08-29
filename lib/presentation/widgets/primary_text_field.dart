import 'package:flutter/material.dart';

import '../../common/style.dart';

class PrimaryTextField extends StatelessWidget {
  final String label;
  const PrimaryTextField({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          fillColor: const Color.fromRGBO(241, 244, 250, 1),
          filled: true,
          labelStyle: textSmall,
          labelText: label,
          contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            borderSide: BorderSide(
              color: Color.fromRGBO(8, 192, 255, 1),
              width: 3,
            ),
          ),
        ),
      ),
    );
  }
}
