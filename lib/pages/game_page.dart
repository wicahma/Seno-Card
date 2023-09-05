import 'package:flutter/material.dart';
import 'package:seno_card/components/bases/base_comp.dart';
import 'package:seno_card/components/bases/setting_comp.dart';
import 'package:seno_card/components/micros/back_button.dart';
import 'package:seno_card/pages/home_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int questionNumber = 1;
  @override
  Widget build(BuildContext context) {
    return BaseComponent(
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
                                          minimumSize: MaterialStatePropertyAll(
                                              Size(double.infinity, 50))),
                                      onPressed: () =>
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomePage())),
                                      child: const Text('YA')),
                                ),
                                Expanded(
                                  child: TextButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Color.fromRGBO(
                                                      255, 195, 73, 1)),
                                          minimumSize: MaterialStatePropertyAll(
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
        child: const Center(child: Text('Start Page')));
  }
}
