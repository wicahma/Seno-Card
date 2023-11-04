import 'package:flutter/material.dart';
import 'package:seno_card/components/bases/base_comp.dart';
import 'package:seno_card/components/bases/setting_comp.dart';
import 'package:seno_card/pages/game_result_page.dart';
import 'package:seno_card/pages/home_page.dart';
import 'dart:math' as math;

class GamePage extends StatefulWidget {
  final List<Map<String, dynamic>> questionList;
  final int questionNumber;
  final String selectedCard;
  const GamePage(
      {super.key,
      required this.questionNumber,
      required this.selectedCard,
      required this.questionList});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late int questionNumber;
  late String selectedCard;
  bool? isAnswered;
  List<String> cards = ['merah', 'cream', 'orange', 'abu', 'biru'];
  double selectedTop = 230, selectedWidth = 0, opacity = 0;
  Future delayed = Future.delayed(const Duration(milliseconds: 500));

  @override
  void initState() {
    super.initState();
    debugPrint(widget.questionList.toString());
    questionNumber = widget.questionNumber;
    selectedCard = widget.selectedCard;
    isAnswered = widget.questionList[questionNumber - 1]["userAnswer"];
    delayed.then((value) {
      setState(() {
        opacity = 1;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedWidth = MediaQuery.of(context).size.width - 150;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        await showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: const Text('Konfirmasi'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                          'Apakah anda yakin ingin meninggalkan permainan?'),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                                style: const ButtonStyle(
                                    minimumSize: MaterialStatePropertyAll(
                                        Size(double.infinity, 50))),
                                onPressed: () => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()),
                                    (r) => false),
                                child: const Text('YA')),
                          ),
                          Expanded(
                            child: TextButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color.fromRGBO(255, 195, 73, 1)),
                                    minimumSize: MaterialStatePropertyAll(
                                        Size(double.infinity, 50))),
                                onPressed: () => Navigator.pop(context),
                                child: const Text('TIDAK')),
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
        return willLeave;
      },
      child: BaseComponent(
          useAppBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.white,
            leading: const SettingComponent(),
            actions: [
              InkWell(
                onTap: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Konfirmasi'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                  'Apakah anda yakin ingin meninggalkan permainan?'),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                        style: const ButtonStyle(
                                            minimumSize:
                                                MaterialStatePropertyAll(
                                                    Size(double.infinity, 50))),
                                        onPressed: () =>
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const HomePage()),
                                                (r) => false),
                                        child: const Text('YA')),
                                  ),
                                  Expanded(
                                    child: TextButton(
                                        style: const ButtonStyle(
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Color.fromRGBO(
                                                        255, 195, 73, 1)),
                                            minimumSize:
                                                MaterialStatePropertyAll(
                                                    Size(double.infinity, 50))),
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('TIDAK')),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                child: const Icon(Icons.home_rounded,
                    size: 45, color: Color.fromRGBO(255, 195, 73, 1)),
              ),
              const SizedBox(width: 10),
            ],
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.elliptical(20, 20))),
            title: Card(
                elevation: 10,
                surfaceTintColor: const Color.fromRGBO(255, 195, 73, 1),
                shadowColor: Colors.black.withOpacity(0.3),
                color: const Color.fromRGBO(255, 195, 73, 1),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Text(
                    "$questionNumber/20",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
            centerTitle: true,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
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
                        offset: Offset("merah".contains(selectedCard) ? 0 : -65,
                            "merah".contains(selectedCard) ? selectedTop : 45),
                        child: Transform.rotate(
                          alignment: Alignment.center,
                          angle: "merah".contains(selectedCard)
                              ? 0 * (math.pi / 180)
                              : -30 * (math.pi / 180),
                          child: Image.asset(
                            width: "merah".contains(selectedCard)
                                ? selectedWidth
                                : 113,
                            "assets/images/merah-${"merah".contains(selectedCard) ? "belakang" : "depan"}.png",
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: "cream",
                      child: Transform.translate(
                        offset: Offset("cream".contains(selectedCard) ? 0 : -35,
                            "cream".contains(selectedCard) ? selectedTop : 15),
                        child: Transform.rotate(
                          angle: "cream".contains(selectedCard)
                              ? 0
                              : -19 * (math.pi / 180),
                          child: Image.asset(
                            "assets/images/cream-${"cream".contains(selectedCard) ? "belakang" : "depan"}.png",
                            width: "cream".contains(selectedCard)
                                ? selectedWidth
                                : 113,
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: "orange",
                      child: Transform.translate(
                        offset: Offset(0,
                            "orange".contains(selectedCard) ? selectedTop : 0),
                        child: Transform.rotate(
                          angle: 0 * (math.pi / 180),
                          child: Image.asset(
                            "assets/images/orange-${"orange".contains(selectedCard) ? "belakang" : "depan"}.png",
                            width: "orange".contains(selectedCard)
                                ? selectedWidth
                                : 113,
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: "abu",
                      child: Transform.translate(
                        offset: Offset("abu".contains(selectedCard) ? 0 : 30,
                            "abu".contains(selectedCard) ? selectedTop : 13),
                        child: Transform.rotate(
                          angle: "abu".contains(selectedCard)
                              ? 0
                              : 20 * (math.pi / 180),
                          child: Image.asset(
                            "assets/images/abu-${"abu".contains(selectedCard) ? "belakang" : "depan"}.png",
                            width: "abu".contains(selectedCard)
                                ? selectedWidth
                                : 113,
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: "biru",
                      child: Transform.translate(
                        offset: Offset("biru".contains(selectedCard) ? 0 : 60,
                            "biru".contains(selectedCard) ? selectedTop : 30),
                        child: Transform.rotate(
                          angle: "biru".contains(selectedCard)
                              ? 0
                              : 30 * (math.pi / 180),
                          child: Image.asset(
                            "assets/images/biru-${"biru".contains(selectedCard) ? "belakang" : "depan"}.png",
                            width: "biru".contains(selectedCard)
                                ? selectedWidth
                                : 113,
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                        offset: Offset(0, selectedTop + 50),
                        child: AnimatedOpacity(
                          opacity: opacity,
                          duration: const Duration(milliseconds: 500),
                          child: SizedBox(
                            width: selectedWidth,
                            height: selectedWidth + 50,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.questionList[questionNumber - 1]
                                        ["question"],
                                    style: const TextStyle(height: 1),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                            style: ButtonStyle(
                                                foregroundColor: MaterialStatePropertyAll(
                                                    isAnswered != null &&
                                                            isAnswered == false
                                                        ? Colors.white
                                                        : Colors.grey),
                                                backgroundColor: MaterialStatePropertyAll(
                                                    isAnswered != null &&
                                                            isAnswered != true
                                                        ? Colors.grey
                                                        : Colors.white),
                                                shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15))),
                                                side: const MaterialStatePropertyAll(
                                                    BorderSide(color: Colors.grey))),
                                            onPressed: () {
                                              widget.questionList[
                                                      questionNumber - 1]
                                                  ["userAnswer"] = false;
                                              setState(() {
                                                isAnswered = false;
                                              });
                                            },
                                            child: const Text(
                                              "TIDAK",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: TextButton(
                                            style: ButtonStyle(
                                                foregroundColor: MaterialStatePropertyAll(
                                                    isAnswered != null &&
                                                            isAnswered == true
                                                        ? Colors.white
                                                        : Colors.grey),
                                                backgroundColor: MaterialStatePropertyAll(
                                                    isAnswered != null &&
                                                            isAnswered != false
                                                        ? Colors.grey
                                                        : Colors.white),
                                                shape: MaterialStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                15))),
                                                side: const MaterialStatePropertyAll(
                                                    BorderSide(color: Colors.grey))),
                                            onPressed: () {
                                              widget.questionList[
                                                      questionNumber - 1]
                                                  ["userAnswer"] = true;
                                              setState(() {
                                                isAnswered = true;
                                              });
                                            },
                                            child: const Text("YA", style: TextStyle(fontWeight: FontWeight.bold))),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                int newIndex = cards.indexWhere((element) =>
                                    element.contains(selectedCard));
                                if (newIndex.clamp(1, 4) == newIndex) {
                                  newIndex--;
                                } else {
                                  newIndex = 4;
                                }
                                debugPrint(newIndex.toString());
                                if (questionNumber > 1) {
                                  setState(() {
                                    opacity = 0;
                                  });
                                  delayed.then((value) => Navigator.pop(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration:
                                            const Duration(milliseconds: 500),
                                        reverseTransitionDuration:
                                            const Duration(milliseconds: 500),
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return GamePage(
                                              questionList: widget.questionList,
                                              questionNumber:
                                                  widget.questionNumber - 1,
                                              selectedCard: cards[newIndex]);
                                        },
                                      )));
                                }
                              },
                              style: ButtonStyle(
                                  elevation: const MaterialStatePropertyAll(10),
                                  shadowColor: const MaterialStatePropertyAll(
                                    Color.fromRGBO(255, 195, 73, .5),
                                  ),
                                  foregroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.white),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  padding: const MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10)),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(13)))),
                              child: const Text(
                                'Sebelumnya',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(226, 212, 185, 1)),
                              ),
                            ),
                            const SizedBox(width: 15),
                            TextButton(
                              onPressed: questionNumber < 20
                                  ? () {
                                      int newIndex = cards.indexWhere(
                                          (element) =>
                                              element.contains(selectedCard));
                                      if (newIndex.clamp(0, 3) == newIndex) {
                                        newIndex++;
                                      } else {
                                        newIndex = 0;
                                      }
                                      if (isAnswered == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                dismissDirection:
                                                    DismissDirection.none,
                                                showCloseIcon: true,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            top:
                                                                Radius.circular(
                                                                    15))),
                                                duration:
                                                    Duration(milliseconds: 300),
                                                content: Text(
                                                    "Pilih jawaban terlebih dahulu")));
                                        return;
                                      }
                                      setState(() {
                                        opacity = 1;
                                      });
                                      delayed.then((value) => Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            transitionDuration: const Duration(
                                                milliseconds: 800),
                                            pageBuilder: (context, animation,
                                                secondaryAnimation) {
                                              return GamePage(
                                                  questionList:
                                                      widget.questionList,
                                                  questionNumber:
                                                      widget.questionNumber + 1,
                                                  selectedCard:
                                                      cards[newIndex]);
                                            },
                                          )));
                                    }
                                  : () {
                                      int score = 0;
                                      List<String> desc = [];
                                      for (var element in widget.questionList) {
                                        if (element["userAnswer"] ==
                                                element["answer"] ||
                                            element["answer"] == null) {
                                          score += 5;
                                          desc.add(element["desc"][0]);
                                        } else {
                                          desc.add(element["desc"][1]);
                                        }
                                      }
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GameResultPage(
                                                    score: score,
                                                    desc: desc,
                                                  )),
                                          (r) => false);
                                    },
                              style: ButtonStyle(
                                  elevation: const MaterialStatePropertyAll(10),
                                  shadowColor: const MaterialStatePropertyAll(
                                    Color.fromRGBO(255, 195, 73, .5),
                                  ),
                                  foregroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.white),
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(255, 195, 73, 1)),
                                  padding: const MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10)),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(13)))),
                              child: Text(
                                questionNumber < 20 ? 'Selanjutnya' : 'Selesai',
                                style: const TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
