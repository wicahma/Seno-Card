import 'package:flutter/material.dart';
import 'package:seno_card/components/bases/base_comp.dart';
import 'package:seno_card/components/bases/setting_comp.dart';
import 'package:seno_card/pages/home_page.dart';
import 'dart:math' as math;

class GameResultPage extends StatefulWidget {
  final int score;
  final List<String> desc;
  const GameResultPage({super.key, required this.score, required this.desc});

  @override
  State<GameResultPage> createState() => _GameResultPageState();
}

class _GameResultPageState extends State<GameResultPage> {
  String titleResult = "";
  String jenis = "";
  List<String> reccomendationResult = [];
  String subtitleResult = "";
  String descResult = "";
  String selectedCard = "";

  @override
  void initState() {
    super.initState();
    initLogic();
  }

  void initLogic() {
    setState(() {
      if (widget.score >= 45 && widget.score <= 100) {
        titleResult = "Yeayy, Selamat!!";
        subtitleResult = "Kamu sudah mengenal identitas diri kamu dengan baik.";
        reccomendationResult = [
          "Yuk tulis jurnal harianmu untuk dapat lebih mengenal emosi yang kamu rasakan",
          "Berani untuk mengkomunikasikan masalah kamu dengan baik"
        ];
        descResult = widget.desc.join(" ");
        if (widget.score >= 45 && widget.score <= 65) jenis = "Sedang";
        if (widget.score >= 70 && widget.score <= 90) jenis = "Tinggi";
        if (widget.score >= 90) jenis = "Sangat Tinggi";
      } else {
        titleResult = "Yahh, kamu gagal";
        subtitleResult =
            "Sayang sekalii, kamu masih belum mengenal identitas diri kamu ☹";
        reccomendationResult = [
          "Yukk coba bermain Seno Card Bersama temanmu untuk dapat mengenal diri kamu dan juga teman kamu. Seno Card dapt dibeli melalui link ini yaa...",
          "Filter kritik dari orang lain untuk direnungkan, kamu tidak perlu menerima atau menolak semua kritikan orang lain",
          "Yukk mulai tulis jurnal harianmu."
        ];
        descResult = widget.desc.join(" ");
        if (widget.score >= 20 && widget.score <= 40) jenis = "Rendah";
        if (widget.score <= 20) jenis = "Sangat Rendah";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (r) => false);
          return false;
        },
        child: BaseComponent(
          useAppBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.white,
            leading: const SettingComponent(),
          ),
          child: Stack(alignment: Alignment.center, children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30), top: Radius.circular(200)),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 5 / 7,
                margin: const EdgeInsets.fromLTRB(15, 40, 15, 30),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                widthFactor: MediaQuery.of(context).size.width,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Hero(
                      tag: "merah",
                      child: Transform.translate(
                        offset: const Offset(-65, 45),
                        child: Transform.rotate(
                          alignment: Alignment.center,
                          angle: -30 * (math.pi / 180),
                          child: Image.asset(
                            width: 113,
                            "assets/images/merah-depan.png",
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: "cream",
                      child: Transform.translate(
                        offset: const Offset(-35, 15),
                        child: Transform.rotate(
                          angle: -19 * (math.pi / 180),
                          child: Image.asset(
                            "assets/images/cream-depan.png",
                            width: 113,
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: "orange",
                      child: Transform.translate(
                        offset: const Offset(0, 0),
                        child: Transform.rotate(
                          angle: 0 * (math.pi / 180),
                          child: Image.asset(
                            "assets/images/orange-depan.png",
                            width: 113,
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: "abu",
                      child: Transform.translate(
                        offset: const Offset(30, 13),
                        child: Transform.rotate(
                          angle: 20 * (math.pi / 180),
                          child: Image.asset(
                            "assets/images/abu-depan.png",
                            width: 113,
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: "biru",
                      child: Transform.translate(
                        offset: const Offset(60, 30),
                        child: Transform.rotate(
                          angle: 30 * (math.pi / 180),
                          child: Image.asset(
                            "assets/images/biru-depan.png",
                            width: 113,
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                        offset: const Offset(0, 230),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          width: MediaQuery.of(context).size.width - 50,
                          height: MediaQuery.of(context).size.height - 390,
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(
                                titleResult,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    height: 1.3),
                              ),
                              Text(
                                subtitleResult,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                    color: Color.fromRGBO(252, 235, 227, 1),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "Skor kamu $jenis",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                    color: Color.fromRGBO(252, 235, 227, 1),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    descResult,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      // height: 1,
                                    ),
                                  )),
                              Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                    color: Color.fromRGBO(252, 235, 227, 1),
                                  ),
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        "Rekomendasi",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          height: 1,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      for (var i = 0;
                                          i < reccomendationResult.length;
                                          i++)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text("${(i + 1).toString()}. "),
                                              Flexible(
                                                child: Text(
                                                  reccomendationResult[i],
                                                  textAlign: TextAlign.start,
                                                  softWrap: true,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    // height: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  )),
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: IconButton.filled(
                              iconSize: 38,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              color: Colors.white,
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                shadowColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(255, 195, 73, 1),
                                ),
                                elevation: const MaterialStatePropertyAll(15),
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(255, 195, 73, 1),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()),
                                    (r) => false);
                              },
                              icon: const Icon(Icons.home_rounded))),
                    )
                  ],
                )),
          ]),
        ));
  }
}
