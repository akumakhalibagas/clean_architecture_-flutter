import 'package:flutter/material.dart';
import '../../common/style.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Center(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                fillColor: const Color.fromRGBO(241, 244, 250, 1),
                filled: true,
                hintStyle: textSmall,
                hintText: 'Nomor Telepon',
                contentPadding: const EdgeInsets.fromLTRB(75, 20, 12, 20),
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
          ),
          const Positioned(
            left: 10,
            child: Text(
              '+62',
              style: textMediumBlack,
            ),
          ),
          const Positioned(
            left: 50,
            child: SizedBox(
              height: 25,
              child: VerticalDivider(
                color: Color.fromRGBO(222, 222, 222, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
