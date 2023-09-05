import 'package:flutter/material.dart';

class SettingComponent extends StatefulWidget {
  const SettingComponent({super.key});

  @override
  State<SettingComponent> createState() => _SettingComponentState();
}

class _SettingComponentState extends State<SettingComponent>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  double suara = 50, musik = 50;
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
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          contentPadding: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          backgroundColor: const Color.fromRGBO(255, 195, 73, 1),
          content: StatefulBuilder(
            builder: (context, setState) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12))),
                    tileColor: Colors.white,
                    leading: const Icon(Icons.volume_up_rounded, size: 35),
                    trailing: const Text(
                      'Suara',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    horizontalTitleGap: 0,
                    title: Slider(
                        max: 100,
                        min: 0,
                        value: suara,
                        label: suara.round().toString(),
                        onChanged: (double value) => setState(() {
                              suara = value;
                            }))),
                const SizedBox(
                  height: 5,
                ),
                ListTile(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4))),
                    tileColor: Colors.white,
                    leading: const Icon(Icons.audiotrack_rounded, size: 35),
                    trailing: const Text(
                      'Musik',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    horizontalTitleGap: 0,
                    title: Slider(
                        max: 100,
                        min: 0,
                        value: musik,
                        label: musik.round().toString(),
                        onChanged: (double value) => setState(() {
                              musik = value;
                            }))),
              ],
            ),
          ),
        ),
      ),
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Transform.rotate(
          angle: _animationController.value * 3.14,
          child: const Icon(
            shadows: [
              Shadow(
                color: Color.fromRGBO(165, 125, 44, 0.3),
                blurRadius: 20,
              ),
            ],
            Icons.settings,
            size: 40,
            color: Color.fromRGBO(255, 195, 73, 1),
          ),
        ),
      ),
    );
  }
}
