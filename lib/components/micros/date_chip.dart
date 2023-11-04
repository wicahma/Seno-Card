import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateChip extends StatefulWidget {
  final Function(dynamic date) dateResult;
  final bool getWeek;
  final String? date;
  final bool enable;
  const DateChip(
      {super.key,
      this.getWeek = false,
      this.date,
      required this.dateResult,
      required this.enable});

  @override
  State<DateChip> createState() => _DateChipState();
}

class _DateChipState extends State<DateChip> {
  String? dates;
  @override
  void initState() {
    super.initState();
    if (widget.date != null && widget.date != "") {
      initializeDateFormatting("id_ID", null).then((_) {
        setState(() {
          dates = DateFormat('EEEE, d MMMM y', 'id_ID')
              .format(DateTime.parse(widget.date!));
        });
      });
      return;
    }
    initializeDateFormatting("id_ID", null).then((_) {
      setState(() {
        dates = DateFormat('EEEE, d MMMM y', 'id_ID')
            .format(DateTime.now().toLocal());
      });
    });
  }

  List<DateTime> getWeekStartAndEndDates(DateTime selectedDate) {
    final firstDayOfWeek =
        selectedDate.subtract(Duration(days: selectedDate.weekday - 1));
    final lastDayOfWeek = firstDayOfWeek.add(const Duration(days: 6));
    return [firstDayOfWeek, lastDayOfWeek];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(254, 249, 255, 1),
          borderRadius: BorderRadius.circular(100)),
      padding: const EdgeInsets.fromLTRB(15, 2, 2, 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 170,
            child: Text(
              dates ?? "",
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: widget.enable
                ? () async {
                    DateTime? getDate = await showDatePicker(
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1945),
                      lastDate: DateTime(2100),
                    );
                    if (getDate == null) return;
                    if (getDate.isAfter(DateTime.now())) {
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          dismissDirection: DismissDirection.none,
                          showCloseIcon: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15))),
                          duration: Duration(milliseconds: 300),
                          content:
                              Text("Tanggal tidak boleh melebihi hari ini!")));
                      return;
                    }
                    if (widget.getWeek == true) {
                      List result = getWeekStartAndEndDates(getDate);
                      setState(() {
                        dates = DateFormat('EEEE, d MMMM y', 'id_ID')
                            .format(getDate.toLocal());
                        widget.dateResult(result);
                      });
                      return;
                    } else {
                      setState(() {
                        dates = DateFormat('EEEE, d MMMM y', 'id_ID')
                            .format(getDate.toLocal());
                        widget.dateResult(getDate);
                      });
                      return;
                    }
                  }
                : null,
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
