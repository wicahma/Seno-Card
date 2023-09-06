import 'package:flutter/material.dart';

class WeekChip extends StatefulWidget {
  final String day;
  final int date;
  const WeekChip({super.key, required this.day, required this.date});

  @override
  State<WeekChip> createState() => _WeekChipState();
}

class _WeekChipState extends State<WeekChip> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(241, 218, 244, 1),
                Color.fromRGBO(245, 206, 250, 1),
              ],
            ),
          ),
          height: 70,
          width: (MediaQuery.of(context).size.width / 7) - 6,
          margin: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.day,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                ),
                Text(
                  widget.date.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Quicksand",
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Image.asset("assets/images/mood-5.png",
            width: (MediaQuery.of(context).size.width / 7) - 6),
      ],
    );
  }
}
