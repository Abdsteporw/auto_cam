import 'package:auto_cam/Controller/Painters/Box_Painter.dart';
import 'package:auto_cam/Model/Main_Models/Box_model.dart';
import 'package:get/get.dart';

class Draw_Controller extends GetxController {

  // main draw method that call Box_Painter witch is the custom painter for box view screen
  // this method shod get box model as parameter and pass that box_model to box_painter to draw it
  Box_Painter draw_Box(Box_model box_model) {

    Box_Painter boxPainter = Box_Painter();

    print(box_model.box_pieces.length);

    box_model.box_pieces.forEach((element) {
      print('piece name :${element.piece_name}');
      element.piece_faces.forEach((element) {
        print('face name :${element.face_name}');
        element.face_item.forEach((element) {
          print(" item :$element");
        });
      });
      print('#############');
    });

    return boxPainter;
  }
}
