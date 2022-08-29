import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PrimaryPinPut extends StatelessWidget {
  final Function(String)? onComplete;
  const PrimaryPinPut({Key? key, this.onComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 40,
      ),
      child: Pinput(
        onCompleted: onComplete,
        length: 6,
        defaultPinTheme: const PinTheme(
          height: 25.0,
          width: 25.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            color: Color.fromRGBO(241, 244, 250, 1),
          ),
        ),
      ),
    );
  }
}
