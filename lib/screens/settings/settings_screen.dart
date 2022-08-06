import 'package:Quizy/screens/settings/widgets/custom_textfield.dart';
import 'package:Quizy/utils/hive_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../shared/shared_widget.dart';
import '../home/home_screen.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);
  static const screenRoute = 'settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Box? box = Hive.box(DatabaseBoxConstant.storage);
  TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    nameController.text = box!.get(DatabaseFieldConstant.userName);
    super.initState();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomWidgets().mainColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: CustomWidgets().backgroundColor,
                        borderRadius: BorderRadius.circular(30)),
                    height: MediaQuery.of(context).size.height - 55,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(children: [
                    const SizedBox(
                      height: 70,
                    ),
                    const Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    CustomTextField(nameController: nameController),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              primary: nameController.text.isEmpty
                                  ? Colors.grey
                                  : CustomWidgets().mainColor,
                            ),
                            onPressed: () async {
                              nameController.text.isEmpty
                                  ? null
                                  : Get.offAll(() => HomeScreen());

                              await box!.put(DatabaseFieldConstant.userName,
                                  nameController.text);

                              setState(() {});
                            },
                            child: const Text("Save")),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
