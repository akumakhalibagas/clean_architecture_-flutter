import 'package:flutter/material.dart';

import '../../common/style.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const PrimaryButton({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(8, 192, 255, 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(8, 192, 255, .2),
                    blurRadius: 50.0,
                    offset: Offset(0, 10))
              ]),
          child: Center(
            child: Text(
              text,
              style: textMediumWhite,
            ),
          ),
        ),
      ),
    );
  }
}
