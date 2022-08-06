import 'package:Quizy/routes/routes.dart';
import 'package:Quizy/utils/hive_const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

late Box box;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox(DatabaseBoxConstant.storage);

  box = Hive.box(DatabaseBoxConstant.storage);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute:
          box.get(DatabaseFieldConstant.userName) != null ? "/" : "inital",
      routes: routes,
    );
  }
}
