
import 'package:auto_cam/Model/Main_Models/Point_model.dart';

class Groove_model{

  late int id;
  late Point_model start_point;
  late Point_model end_point;
  late double groove_width;
  late double groove_depth;

  Groove_model(this.id, this.start_point, this.end_point, this.groove_width,
      this.groove_depth);
}