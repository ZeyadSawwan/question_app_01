import 'package:hive_flutter/hive_flutter.dart';
import '../../model/categorys_home_screen_model.dart';
import '../../utils/hive_const.dart';

class HomeBloc {
  final box = Hive.box(DatabaseBoxConstant.storage);

  List<CategorysModel> listOfCategory = [
    CategorysModel(
      categoryName: "Math",
      image: "assets/images/math.png",
      questionNumbers: "10 Question",
      route: 'quizScreen',
      description: "adsadadsa asd asdasdad asdadasda sadasdadada dasdad ",
    ),
    CategorysModel(
      categoryName: "History",
      image: "assets/images/history.png",
      questionNumbers: "10 Question",
      route: 'quizScreen',
      description:
          "description : dsad asdasdasdad asdadadada sdasdasdas sadadsada asdasdadssa",
    ),
    CategorysModel(
      categoryName: "Sports",
      image: "assets/images/sports.png",
      questionNumbers: "10 Question",
      route: 'quizScreen',
      description: "adsadadsa asd asdasdad asdadasda sadasdadada dasdad ",
    ),
    CategorysModel(
      categoryName: "Science",
      image: "assets/images/science.png",
      questionNumbers: "10 Question",
      route: 'quizScreen',
      description: "adsadadsa asd asdasdad asdadasda sadasdadada dasdad ",
    )
  ];
}
