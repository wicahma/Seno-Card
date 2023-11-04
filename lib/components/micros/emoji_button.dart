import 'package:flutter/material.dart';

class EmojiButton extends StatefulWidget {
  final int mood;
  final Function(int mood) onSelected;
  final isActive;

  const EmojiButton(
      {super.key,
      required this.mood,
      required this.onSelected,
      required this.isActive});

  @override
  State<EmojiButton> createState() => _EmojiButtonState();
}

class _EmojiButtonState extends State<EmojiButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onSelected(widget.mood),
      child: Card(
        elevation: widget.isActive ? 15 : 0,
        borderOnForeground: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: BorderSide(
                color: widget.isActive
                    ? Colors.yellow.shade100
                    : Colors.transparent,
                strokeAlign: 1,
                width: 3)),
        child: Image.asset(
          "assets/images/mood-${widget.mood}.png",
          width: (MediaQuery.of(context).size.width / 5) - 20,
        ),
      ),
    );
  }
}
