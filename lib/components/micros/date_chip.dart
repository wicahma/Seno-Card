import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateChip extends StatefulWidget {
  const DateChip({super.key});

  @override
  State<DateChip> createState() => _DateChipState();
}

class _DateChipState extends State<DateChip> {
  String? dates;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting("id_ID", null).then((_) {
      setState(() {
        dates = DateFormat('EEEE, d MMMM y', 'id_ID')
            .format(DateTime.now().toLocal());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromRGBO(254, 249, 255, 1),
          borderRadius: BorderRadius.circular(100)),
      padding: const EdgeInsets.fromLTRB(15, 2, 2, 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dates ?? "",
            style: const TextStyle(
                fontSize: 12,
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () => {},
            child: const Card(
              elevation: 0,
              color: Color.fromRGBO(177, 121, 184, 1),
              child: Padding(
                padding: EdgeInsets.all(3),
                child: Icon(
                  Icons.calendar_month_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
