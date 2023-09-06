import 'package:flutter/material.dart';
import 'package:seno_card/components/bases/base_comp.dart';
import 'package:seno_card/components/micros/back_button.dart';
import 'package:seno_card/components/micros/date_chip.dart';
import 'package:seno_card/components/micros/emoji_button.dart';

class CreateJurnalPage extends StatefulWidget {
  const CreateJurnalPage({super.key});

  @override
  State<CreateJurnalPage> createState() => _CreateJurnalPageState();
}

class _CreateJurnalPageState extends State<CreateJurnalPage> {
  @override
  Widget build(BuildContext context) {
    return BaseComponent(
      useAppBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black.withOpacity(0.3),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: const BackBtn(),
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
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DateChip(),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(177, 121, 184, 1),
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: const Column(
                children: [
                  Text(
                    "What's ur mood now?",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      EmojiButton(
                        mood: 1,
                      ),
                      EmojiButton(
                        mood: 2,
                      ),
                      EmojiButton(
                        mood: 3,
                      ),
                      EmojiButton(
                        mood: 4,
                      ),
                      EmojiButton(
                        mood: 5,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(20),
                child: const Column(
                  children: [
                    TextField(
                      maxLines: 2,
                      decoration: InputDecoration.collapsed(
                          hintText: "Apa tema hari ini?"),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: TextField(
                          maxLines: 100,
                          decoration: InputDecoration.collapsed(
                              hintText: "Ceritakan tentang hari ini"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
