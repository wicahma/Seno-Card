import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:seno_card/components/bases/base_comp.dart';
import 'package:seno_card/components/logic/storage_logic.dart';
import 'package:seno_card/components/micros/date_chip.dart';
import 'package:seno_card/components/micros/week_chip.dart';
import 'package:seno_card/components/micros/jurnal_list.dart';
import 'package:seno_card/pages/create_jurnal_page.dart';
import 'package:seno_card/pages/home_page.dart';
import 'package:seno_card/pages/login_page.dart';

class JurnalPage extends StatefulWidget {
  const JurnalPage({super.key});

  @override
  State<JurnalPage> createState() => _JurnalPageState();
}

class _JurnalPageState extends State<JurnalPage> {
  List<Map<String, dynamic>> dateRange = [];
  List<dynamic> jurnalList = [];
  User? user = FirebaseAuth.instance.currentUser;
  String nama = "";

  List<Map<String, dynamic>> getDatesBetween(
      DateTime startDate, DateTime endDate) {
    DateTime today = DateTime.now();
    List<Map<String, dynamic>> dateList = [
      {'day': 'Sen', 'date': null, 'mood': null, 'isPast': false},
      {'day': 'Sel', 'date': null, 'mood': null, 'isPast': false},
      {'day': 'Rab', 'date': null, 'mood': null, 'isPast': false},
      {'day': 'Kam', 'date': null, 'mood': null, 'isPast': false},
      {'day': 'Jum', 'date': null, 'mood': null, 'isPast': false},
      {'day': 'Sab', 'date': null, 'mood': null, 'isPast': false},
      {'day': 'Min', 'date': null, 'mood': null, 'isPast': false},
    ];

    for (var i = 0; i < dateList.length; i++) {
      dateList[i]['date'] = startDate.add(Duration(days: i)).day;
      if (startDate.add(Duration(days: i)).isBefore(today)) {
        dateList[i]['isPast'] = true;
      }
    }

    return dateList;
  }

  @override
  void initState() {
    super.initState();
    initLogic();
    getUserData();
    setBaseData();
  }

  Future<void> setBaseData() async {
    if (!context.mounted) return;
    Map<String, dynamic> user =
        jsonDecode(await StorageLogic().getData(key: 'user-data') ?? '{}');
    setState(() {
      nama = user['nama'] ?? "None";
    });
  }

  void getUserData() {
    if (user == null) {
      Future(() => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false));
    }
  }

  void initLogic() {
    final startDate = DateTime.now();
    final firstDayOfWeek =
        startDate.subtract(Duration(days: startDate.weekday - 1));
    final lastDayOfWeek = firstDayOfWeek.add(const Duration(days: 6));
    List<Map<String, dynamic>> dateRanges =
        getDatesBetween(firstDayOfWeek, lastDayOfWeek);
    dateRange = dateRanges;
    getDataFromStorage(startDate: firstDayOfWeek, endDate: lastDayOfWeek);
  }

  Future<void> getDataFromStorage(
      {required DateTime startDate, required DateTime endDate}) async {
    List<dynamic>? dataJurnal = jsonDecode(
        await StorageLogic().getData(key: 'jurnals', type: String) ?? "[]");
    if (dataJurnal == null) return;
    List<dynamic> selectedList = [];
    dataJurnal.sort(
      (a, b) =>
          DateTime.parse(a['tanggal']).compareTo(DateTime.parse(b['tanggal'])),
    );

    for (dynamic date in dataJurnal) {
      if (DateTime.parse(date['tanggal'])
              .isAfter(startDate.subtract(const Duration(days: 1))) &&
          DateTime.parse(date['tanggal'])
              .isBefore(endDate.add(const Duration(days: 1)))) {
        selectedList.add(date);
      }
    }

    debugPrint(selectedList.toString());

    setState(() {
      jurnalList = selectedList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        return false;
      },
      child: BaseComponent(
          useAppBar: AppBar(
            elevation: 5,
            shadowColor: Colors.black.withOpacity(0.3),
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.home_rounded,
                  size: 30,
                  color: Color.fromRGBO(177, 121, 184, 1),
                )),
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.elliptical(20, 20))),
            title: Text(
              'journal'.toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(177, 121, 184, 1)),
            ),
            centerTitle: true,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: RefreshIndicator(
              onRefresh: () {
                setState(() {
                  initLogic();
                });
                return Future.delayed(const Duration(seconds: 1));
              },
              child: CustomScrollView(
                clipBehavior: Clip.none,
                slivers: [
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            height: 45,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(177, 121, 184, .1),
                                    width: 1),
                                color: const Color.fromRGBO(247, 233, 248, 1),
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 6),
                                child: Text(
                                  "Hey, $nama",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.black
                                      //  Color.fromRGBO(177, 121, 184, 1)
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        DateChip(
                          enable: true,
                          getWeek: true,
                          dateResult: (date) {
                            List<Map<String, dynamic>> dateRanges =
                                getDatesBetween(date[0], date[1]);
                            getDataFromStorage(
                                startDate: date[0], endDate: date[1]);
                            if (!context.mounted) return;
                            setState(() {
                              dateRange = dateRanges;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...dateRange.map((e) {
                            for (var element in jurnalList) {
                              if (e['date'] ==
                                  DateTime.parse(element['tanggal']).day) {
                                e['mood'] = element['mood'];
                              }
                            }
                            return WeekChip(
                              day: e['day'],
                              date: e['date'],
                              mood: e['mood'],
                              isPast: e['isPast'],
                            );
                          })
                        ]),
                  ),
                  SliverAppBar.large(
                    expandedHeight: 130,
                    backgroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    pinned: true,
                    floating: false,
                    leading: const SizedBox(),
                    leadingWidth: 0,
                    bottom: const PreferredSize(
                      preferredSize: Size.fromHeight(60),
                      child: Text(''),
                    ),
                    clipBehavior: Clip.none,
                    flexibleSpace: Container(
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(177, 121, 184, 0.3),
                              blurRadius: 20,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      width: double.infinity,
                      height: 130,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: const Color.fromRGBO(177, 121, 184, .2),
                          highlightColor:
                              const Color.fromRGBO(177, 121, 184, .3),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CreateJurnalPage(
                                        isEdit: false,
                                      ))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                  image:
                                      AssetImage("assets/images/add-sign.png")),
                              Text(
                                "What do you feel today, write here..",
                                style: TextStyle(
                                    fontFamily: "Quicksand",
                                    fontSize: 12,
                                    color: Colors.grey.shade600),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (jurnalList.isEmpty)
                    const SliverFillRemaining(
                      child: Center(
                        child: Text("Jurnal tidak ada."),
                      ),
                    )
                  else
                    SliverList(
                        delegate: SliverChildListDelegate([
                      ...jurnalList.map((e) {
                        debugPrint(e['tanggal']);
                        return JurnalList(
                          dayTime: e['tanggal'],
                          mood: e['mood'],
                          title: e['judul'],
                          description:
                              Document.fromJson(jsonDecode(e['cerita']))
                                  .toPlainText(),
                          cerita: Document.fromJson(jsonDecode(e['cerita'])),
                        );
                      })
                    ]))
                ],
              ),
            ),
          )),
    );
  }
}
