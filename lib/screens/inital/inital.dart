import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/custom_logo.dart';
import '../../shared/shared_widget.dart';
import '../../utils/hive_const.dart';
import '../home/home_screen.dart';
import 'inital_bloc.dart';

class InitalScreen extends StatefulWidget {
  const InitalScreen({
    Key? key,
  }) : super(key: key);
  static const screenRoute = 'inital';

  @override
  State<InitalScreen> createState() => _InitalScreenState();
}

class _InitalScreenState extends State<InitalScreen> {
  @override
  void initState() {
    TextEditingController controller = TextEditingController();
    super.initState();
  }

  TextEditingController controller = TextEditingController();
  var bloc = InitalBloc();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: CustomWidgets().backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: CustomWidgets().mainColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  height: MediaQuery.of(context).size.width / 1.1,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/cross_lines.png",
                    scale: 0.1,
                    color: const Color.fromARGB(52, 224, 223, 223),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomLogo(
                        scale: 7,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                          padding: const EdgeInsets.all(23),
                          height: 330,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              const Text(
                                "Welcome to Quizy",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  errorText: controller.text.isEmpty
                                      ? "You Most Enter Your UserName"
                                      : null,
                                  labelText: "Full Name",
                                  labelStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: const Color(0xffefefef),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: controller.text.isEmpty
                                        ? Colors.grey
                                        : CustomWidgets().mainColor,
                                    borderRadius: BorderRadius.circular(10)),
                                width: MediaQuery.of(context).size.width,
                                height: 45,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.transparent,
                                        elevation: 0),
                                    onPressed: () async {
                                      controller.text.isEmpty
                                          ? null
                                          : Get.offAll(() => HomeScreen());

                                      await bloc.box!.put(
                                          DatabaseFieldConstant.userName,
                                          controller.text);

                                      setState(() {});
                                    },
                                    child: const Text("Login")),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                onPressed: () async {
                                  controller.text.isEmpty
                                      ? await bloc.box!.put(
                                          DatabaseFieldConstant.userName,
                                          "Guest")
                                      : bloc.box!.put(
                                          DatabaseFieldConstant.userName,
                                          controller.text);
                                  Get.offAll(() => HomeScreen());
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      color: Colors.grey,
                                      height: 2,
                                      width: 120,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 1),
                                      child: SizedBox(
                                        width: 38,
                                        height: 38,
                                        child: Text(
                                          "Guest",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.grey,
                                      height: 2,
                                      width: 120,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
