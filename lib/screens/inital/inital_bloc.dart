import 'package:hive/hive.dart';
import '../../utils/hive_const.dart';

class InitalBloc {
  Box? box = Hive.box(DatabaseBoxConstant.storage);
}
