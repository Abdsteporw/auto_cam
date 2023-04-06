import 'package:auto_cam/Model/Main_Models/Groove_model.dart';
import 'package:auto_cam/Model/Main_Models/Join_model.dart';

class Face_model{

  late List<Join_model> join_list;
  late List<Groove_model> groove_list;
  late List<int> face_item;

  Face_model(this.face_item,this.join_list,this.groove_list);


}