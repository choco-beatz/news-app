import 'package:hive/hive.dart';

part 'favs_hive_model.g.dart'; // ✅ Auto-generated file

@HiveType(typeId: 0) // ✅ Unique typeId for the model
class FavsModel extends HiveObject {
  @HiveField(0)
  String? title;


  FavsModel({this.title});
}
