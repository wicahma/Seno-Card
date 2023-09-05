import 'package:flutter/material.dart';
import 'package:seno_card/components/bases/base_comp.dart';
import 'package:seno_card/components/micros/back_button.dart';

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
        child: Center(child: Text('Jurnal Page')));
  }
}
