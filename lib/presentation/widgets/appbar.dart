import 'package:flutter/material.dart';

class AppBarLoyalty extends StatelessWidget {
  const AppBarLoyalty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const ImageIcon(
                AssetImage('assets/images/icon_back.png'),
                size: 24,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 24),
            child: ImageIcon(
              AssetImage('assets/images/icon_help.png'),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
