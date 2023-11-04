import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:seno_card/pages/create_jurnal_page.dart';

class JurnalList extends StatefulWidget {
  final String dayTime;
  final String title;
  final String description;
  final int mood;
  final Document cerita;
  const JurnalList(
      {super.key,
      required this.dayTime,
      required this.cerita,
      required this.title,
      required this.description,
      required this.mood});

  @override
  State<JurnalList> createState() => _JurnalListState();
}

class _JurnalListState extends State<JurnalList> {
  String? inputDate;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting("id_ID", null).then((_) {
      setState(() {
        inputDate = DateFormat('EEEE, d MMMM y \nHH.mm', 'id_ID')
            .format(DateTime.parse(widget.dayTime));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black.withOpacity(.2),
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
            color: Color.fromRGBO(177, 121, 184, .2), width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        splashColor: const Color.fromRGBO(177, 121, 184, .3),
        highlightColor: const Color.fromRGBO(177, 121, 184, .3),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateJurnalPage(
                        isEdit: true,
                        date: widget.dayTime,
                        judul: widget.title,
                        cerita: widget.cerita,
                        mood: widget.mood,
                      )));
          return;
        },
        onLongPress: () {
          return;
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          inputDate ?? "Loading",
                          style: TextStyle(
                              fontFamily: "Quicksand",
                              color: Colors.grey.shade500,
                              fontSize: 10,
                              height: 1,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontFamily: "Quicksand",
                              fontSize: 20,
                              height: 2,
                              color: Color.fromRGBO(177, 121, 184, 1),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Image(
                    fit: BoxFit.contain,
                    height: 50,
                    image: AssetImage(
                        'assets/images/mood-${widget.mood.toString()}.png'),
                  )
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      height: 1,
                      fontSize: 13,
                      fontFamily: "QuickSand"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Lihat selengkapnya >",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Color.fromRGBO(255, 195, 73, 1),
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
