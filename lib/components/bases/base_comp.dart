import 'package:flutter/material.dart';
import 'package:seno_card/components/micros/back_button.dart';

class BaseComponent extends StatefulWidget {
  AppBar? useAppBar;
  final bool extendBodyBehindAppBar;
  final Widget child;
  final List<Widget> stack;
  BaseComponent(
      {super.key,
      this.useAppBar,
      required this.child,
      this.extendBodyBehindAppBar = false,
      this.stack = const []});

  @override
  State<BaseComponent> createState() => _BaseComponentState();
}

class _BaseComponentState extends State<BaseComponent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(247, 233, 247, 1),
              Color.fromRGBO(254, 236, 218, 1),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            image: DecorationImage(
              image: AssetImage('assets/images/senocard-bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        ...widget.stack,
        Scaffold(
            extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
            backgroundColor: Colors.transparent,
            appBar: widget.useAppBar,
            body: SizedBox(
                width: MediaQuery.of(context).size.width, child: widget.child)),
      ],
    );
  }
}
