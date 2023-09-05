import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Color.fromRGBO(177, 121, 184, 1),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
