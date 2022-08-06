import 'dart:io';
import 'package:Quizy/screens/home/widgets/category_grid_view.dart';
import 'package:Quizy/screens/home/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import '../../shared/shared_widget.dart';
import 'home_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const screenRoute = 'home';
  HomeScreen({
    this.image,
    Key? key,
  }) : super(key: key);
  var bloc = HomeBloc();
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomWidgets().mainColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: TopBar()),
            CategoryGridView(listOfCategory: bloc.listOfCategory)
          ],
        ),
      ),
    );
  }
}
