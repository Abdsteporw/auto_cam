
import 'package:auto_cam/Model/Main_Models/Point_model.dart';

class Join_model {

  late int id;
  late Point_model start_point;
  late Point_model end_point;
  late String Join_type;

  Join_model(this.id, this.start_point, this.end_point, this.Join_type);
}