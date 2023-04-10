import 'package:auto_cam/Model/Main_Models/Box_model.dart';

class Box_Repository{
   Box_model box_model=Box_model(400, 600, 600, 18, 6);
  Box_Repository();

  add_Box(Box_model b){
    box_model=b;
  }

}