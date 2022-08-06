import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/shared_widget.dart';
import '../../get_started/get_started_screen.dart';

class CategoryGridView extends StatelessWidget {
  CategoryGridView({Key? key, required this.listOfCategory}) : super(key: key);
  List listOfCategory;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 200,
            decoration: BoxDecoration(
                color: CustomWidgets().backgroundColor,
                borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
              child: GridView.builder(
                  itemCount: listOfCategory.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2.5,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => GetStartedScreen(
                              index2: index,
                              listOfCategory: listOfCategory,
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: const Color.fromARGB(112, 178, 201, 253),
                        ),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                listOfCategory[index].image,
                                color: CustomWidgets().mainColor,
                              ),
                            ),
                            Text(
                              listOfCategory[index].categoryName,
                              style: TextStyle(
                                  color: CustomWidgets().mainColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              listOfCategory[index].questionNumbers,
                              style: TextStyle(
                                color: CustomWidgets().mainColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
            ),
          ),
        ),
      ],
    );
  }
}
