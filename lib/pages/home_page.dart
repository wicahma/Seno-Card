import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seno_card/components/bases/base_comp.dart';
import 'package:seno_card/components/bases/setting_comp.dart';
import 'package:seno_card/pages/game_page.dart';
import 'package:seno_card/pages/informasi_page.dart';
import 'package:seno_card/pages/jurnal_page.dart';
import 'package:seno_card/pages/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(241, 218, 244, 1),
          statusBarIconBrightness: Brightness.dark,
        ),
        leading: const SettingComponent(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserPage())),
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.person_rounded,
                  shadows: [
                    Shadow(
                      color: Color.fromRGBO(165, 125, 44, 0.3),
                      blurRadius: 20,
                    ),
                  ],
                  size: 45,
                  color: Color.fromRGBO(255, 195, 73, 1),
                ),
              ),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: BaseComponent(
          extendBodyBehindAppBar: true,
          stack: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Seno Card",
                      style: TextStyle(
                        color: Color.fromRGBO(38, 88, 139, 1),
                        fontSize: 40,
                        fontFamily: 'AkayaTelivigala',
                      ),
                    ),
                    Text(
                      "Self know card \nTemukan identitas dirimu sekarang!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(38, 88, 139, 1),
                        height: 1,
                        fontSize: 18,
                      ),
                    )
                  ],
                ))
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JurnalPage())),
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(11)))),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(255, 195, 73, 1))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Text(
                      'Jurnal',
                      style: TextStyle(
                          fontSize: 23, fontFamily: 'AkayaTelivigala'),
                    ),
                  )),
              const SizedBox(
                height: 13,
              ),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GamePage())),
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(11)))),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(255, 195, 73, 1))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 65, vertical: 0),
                    child: Text(
                      'Start',
                      style: TextStyle(
                          fontSize: 27, fontFamily: 'AkayaTelivigala'),
                    ),
                  )),
              const SizedBox(
                height: 13,
              ),
              TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InformasiPage())),
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(11)))),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(255, 195, 73, 1))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Text(
                      'Informasi',
                      style: TextStyle(
                          fontSize: 23, fontFamily: 'AkayaTelivigala'),
                    ),
                  ))
            ],
          )),
    );
  }
}
