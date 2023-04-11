
import 'dart:ui';

import 'package:auto_cam/Controller/Painters/Box_Painter.dart';
import 'package:auto_cam/Controller/Repositories_Controllers/Box_Repository.dart';
import 'package:auto_cam/Model/Main_Models/Box_model.dart';
import 'package:get/get.dart';

class Draw_Controller extends GetxController {


  /// scale value that can changes from box editor screen and it will rebuild the box (recall box_Painter with new parameter)
  RxDouble drawing_scale=(1.0).obs;

  /// screen size , its changed from the box edit screen ,and this value here observable from build widget of Box Painter
  Rx<Size> screen_size =Size(800, 600).obs;


  Box_Repository box_repository=Get.find();


  /// main draw method that call Box_Painter witch is the custom painter for box view screen
  /// this method shod get box model as parameter and pass that box_model to box_painter to draw it
  Box_Painter draw_Box(double w) {

    Box_Painter boxPainter = Box_Painter(drawing_scale.value,Size(w,screen_size.value.height));

    return boxPainter;
  }

  add_Box(Box_model box_model){


    box_repository.add_Box(box_model);

  }

 Box_model get_default_box(){
    Box_model box_model=box_repository.box_model.value;

    return box_model;

  }

}
