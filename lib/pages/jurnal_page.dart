import 'package:flutter/material.dart';
import 'package:seno_card/components/bases/base_comp.dart';
import 'package:seno_card/components/micros/date_chip.dart';
import 'package:seno_card/components/micros/week_chip.dart';
import 'package:seno_card/components/micros/jurnal_list.dart';
import 'package:seno_card/pages/create_jurnal_page.dart';

class JurnalPage extends StatefulWidget {
  const JurnalPage({super.key});

  @override
  State<JurnalPage> createState() => _JurnalPageState();
}

class _JurnalPageState extends State<JurnalPage> {
  @override
  Widget build(BuildContext context) {
    return BaseComponent(
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
          child: CustomScrollView(
            clipBehavior: Clip.none,
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 20),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(177, 121, 184, .1),
                              width: 1),
                          color: const Color.fromRGBO(247, 233, 248, 1),
                          borderRadius: BorderRadius.circular(100)),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        child: Text(
                          "Hey, Teguh",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18, color: Colors.black
                              //  Color.fromRGBO(177, 121, 184, 1)
                              ),
                        ),
                      ),
                    ),
                    const DateChip(),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WeekChip(day: "Sen", date: 1),
                    WeekChip(day: "Sel", date: 1),
                    WeekChip(day: "Rab", date: 1),
                    WeekChip(day: "Kam", date: 1),
                    WeekChip(day: "Jum", date: 1),
                    WeekChip(day: "Sab", date: 1),
                    WeekChip(day: "Min", date: 1),
                  ],
                ),
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
                      highlightColor: const Color.fromRGBO(177, 121, 184, .3),
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateJurnalPage())),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                              image: AssetImage("assets/images/add-sign.png")),
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
              SliverList(
                  delegate: SliverChildListDelegate([
                const JurnalList(
                    dayTime: "2023-08-22 23:30:00.000",
                    mood: 1,
                    title: "Tidak bagus sekali hari ini",
                    description:
                        "ini adalah sebuah deskripsi panjang yan dibuat berdasarkan random teks yang diketik sendiri yha"),
                const JurnalList(
                    dayTime: "2023-08-22 23:30:00.000",
                    mood: 1,
                    title: "Tidak bagus sekali hari ini",
                    description:
                        "ini adalah sebuah deskripsi panjang yan dibuat berdasarkan random teks yang diketik sendiri yha"),
                const JurnalList(
                    dayTime: "2023-08-22 23:30:00.000",
                    mood: 1,
                    title: "Tidak bagus sekali hari ini",
                    description:
                        "ini adalah sebuah deskripsi panjang yan dibuat berdasarkan random teks yang diketik sendiri yha"),
                const JurnalList(
                    dayTime: "2023-08-22 23:30:00.000",
                    mood: 1,
                    title: "Tidak bagus sekali hari ini",
                    description:
                        "ini adalah sebuah deskripsi panjang yan dibuat berdasarkan random teks yang diketik sendiri yha"),
                const JurnalList(
                    dayTime: "2023-08-22 23:30:00.000",
                    mood: 1,
                    title: "Tidak bagus sekali hari ini",
                    description:
                        "ini adalah sebuah deskripsi panjang yan dibuat berdasarkan random teks yang diketik sendiri yha"),
                const JurnalList(
                    dayTime: "2023-08-22 23:30:00.000",
                    mood: 1,
                    title: "Tidak bagus sekali hari ini",
                    description:
                        "ini adalah sebuah deskripsi panjang yan dibuat berdasarkan random teks yang diketik sendiri yha"),
                const JurnalList(
                    dayTime: "2023-08-22 23:30:00.000",
                    mood: 1,
                    title: "Tidak bagus sekali hari ini",
                    description:
                        "ini adalah sebuah deskripsi panjang yan dibuat berdasarkan random teks yang diketik sendiri yha"),
                const JurnalList(
                    dayTime: "2023-08-22 23:30:00.000",
                    mood: 1,
                    title: "Tidak bagus sekali hari ini",
                    description:
                        "ini adalah sebuah deskripsi panjang yan dibuat berdasarkan random teks yang diketik sendiri yha"),
                const JurnalList(
                    dayTime: "2023-08-22 23:30:00.000",
                    mood: 1,
                    title: "Tidak bagus sekali hari ini",
                    description:
                        "ini adalah sebuah deskripsi panjang yan dibuat berdasarkan random teks yang diketik sendiri yha"),
                const JurnalList(
                    dayTime: "2023-08-22 23:30:00.000",
                    mood: 1,
                    title: "Tidak bagus sekali hari ini",
                    description:
                        "ini adalah sebuah deskripsi panjang yan dibuat berdasarkan random teks yang diketik sendiri yha"),
              ]))
            ],
          ),
        ));
  }
}
