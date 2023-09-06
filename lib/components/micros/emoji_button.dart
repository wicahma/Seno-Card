import 'package:flutter/material.dart';

class EmojiButton extends StatefulWidget {
  final int mood;
  const EmojiButton({super.key, required this.mood});

  @override
  State<EmojiButton> createState() => _EmojiButtonState();
}

class _EmojiButtonState extends State<EmojiButton> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/mood-${widget.mood}.png",
      width: (MediaQuery.of(context).size.width / 5) - 20,
    );
  }
}
