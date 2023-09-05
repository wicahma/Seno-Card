import 'package:flutter/material.dart';
import 'package:seno_card/components/bases/base_comp.dart';
import 'package:seno_card/components/micros/back_button.dart';

class InformasiPage extends StatefulWidget {
  const InformasiPage({super.key});

  @override
  State<InformasiPage> createState() => _InformasiPageState();
}

class _InformasiPageState extends State<InformasiPage> {
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
            'informasi'.toUpperCase(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(177, 121, 184, 1)),
          ),
          centerTitle: true,
        ),
        child: Center(child: Text('Informasi Page')));
  }
}
