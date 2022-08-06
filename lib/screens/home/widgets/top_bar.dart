import 'package:flutter/material.dart';
import 'package:flutter_cmoon_icons/flutter_cmoon_icons.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../utils/hive_const.dart';
import '../../settings/settings_screen.dart';

class TopBar extends StatelessWidget {
  TopBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final box = Hive.box(DatabaseBoxConstant.storage);

    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              timeselect(),
              Column(
                children: [
                  Text(
                    greeting(),
                    style: TextStyle(color: colorForTimer(), fontSize: 17),
                  ),
                ],
              ),
              Expanded(child: Container()),
              IconButton(
                  onPressed: () {
                    Get.to(() => SettingsScreen());
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 20),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            box.get(DatabaseFieldConstant.userName),
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    ]);
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  Color? colorForTimer() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return const Color(0xffdfbbdd);
    }
    if (hour < 17) {
      return Colors.grey[700];
    }
    return Colors.grey[700];
  }

  Widget timeselect() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return const Padding(
        padding: EdgeInsets.only(right: 5),
        child: CIcon(
          IconMoon.icon_sun,
          size: 20,
          color: Color(0xffdfbbdd),
        ),
      );
    }
    if (hour < 17) {
      return CIcon(
        IconMoon.icon_moon1,
        size: 35,
        color: Colors.grey[700],
      );
    }
    return CIcon(
      IconMoon.icon_moon1,
      size: 35,
      color: Colors.grey[700],
    );
  }
}
