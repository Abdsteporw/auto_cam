
import 'dart:ui';

import 'package:auto_cam/Controller/Painters/Box_Painter.dart';
import 'package:get/get.dart';

class Draw_Controller extends GetxController {


  /// scale value that can changes from box editor screen and it will rebuild the box (recall box_Painter with new parameter)
  double drawing_scale=1;

  /// screen size , its changed from the box edit screen ,and this value here observable from build widget of Box Painter
  Rx<Size> screen_size =Size(800, 600).obs;


  /// main draw method that call Box_Painter witch is the custom painter for box view screen
  /// this method shod get box model as parameter and pass that box_model to box_painter to draw it
  Box_Painter draw_Box() {

    Box_Painter boxPainter = Box_Painter(drawing_scale,screen_size.value);

    return boxPainter;
  }
}
