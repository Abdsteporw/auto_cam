import 'dart:ui';

import 'package:auto_cam/Controller/Painters/Box_Painter.dart';
import 'package:auto_cam/Controller/Repositories_Controllers/Box_Repository.dart';
import 'package:auto_cam/Model/Main_Models/Box_model.dart';
import 'package:auto_cam/Model/Main_Models/Coordinate_3D.dart';
import 'package:auto_cam/Model/Main_Models/Piece_model.dart';
import 'package:auto_cam/Model/Main_Models/Point_model.dart';
import 'package:get/get.dart';

class Draw_Controller extends GetxController {
  /// scale value that can changes from box editor screen and it will rebuild the box (recall box_Painter with new parameter)
  RxDouble drawing_scale = (0.8).obs;

  /// screen size , its changed from the box edit screen ,and this value here observable from build widget of Box Painter
  Rx<Size> screen_size = Size(800, 600).obs;

  /// here we will listen to mouse cursor position , that will changed from drawing screen
  Rx<Offset> mouse_position = Offset(0, 0).obs;

  Box_Repository box_repository = Get.find();

  /// piece id that the mouse hover on to use it when we draw the box , we will give this piece different color
  int hover_id = 90;

  late Box_model box_model;

  Draw_Controller() {
    box_model = box_repository.box_model.value;

  }

  /// main draw method that call Box_Painter witch is the custom painter for box view screen
  /// this method shod get box model as parameter and pass that box_model to box_painter to draw it
  Box_Painter draw_Box(double w) {
    hover_id_find(box_model);
    box_model = box_repository.box_model.value;
    Box_Painter boxPainter = Box_Painter(box_model, drawing_scale.value,
        Size(w, screen_size.value.height), hover_id, mouse_position.value);

    return boxPainter;
  }

  add_Box(Box_model box_model) {
    box_repository.add_Box(box_model);
  }

  Box_model get_default_box() {
    Box_model box_model = box_repository.box_model.value;

    return box_model;
  }

  /// here tow method :
  /// 1-hover_id_finder :
  ///      to loop around box pieces and heck if the mouse cursor is hover on using the second method
  /// 2-check_position :
  ///      this method will receive one piece model and check if cursor hover on it .

  /// the first one :
  hover_id_find(Box_model box_model) {

    List<Piece_model> box_pieces = box_model.box_pieces;

    hover_id=100;
    for (int i = 0; i < box_pieces.length; i++) {
      Piece_model p = box_pieces[i];
      if(p.piece_name=='back_panel'){
        continue;
      }

     else if (check_position(p)) {
        hover_id = p.piece_id;
      }
    }

  }

  ///the second one :
  bool check_position(Piece_model p) {
    bool is_hover = false;


    Cordinate_3D cordinate_3d = p.cordinate_3d;

    List<Point_model> piece_points = cordinate_3d.xy_0_plane;

    double left_down_point_x =(box_model.box_origin.x_coordinate+ piece_points[0].x_coordinate*drawing_scale.value);
    double left_down_point_y =(box_model.box_origin.y_coordinate- piece_points[0].y_coordinate*drawing_scale.value);

    double right_up_point_x  =(box_model.box_origin.x_coordinate+ piece_points[2].x_coordinate*drawing_scale.value);
    double right_up_point_y  =(box_model.box_origin.y_coordinate- piece_points[2].y_coordinate*drawing_scale.value);

    double mouse_position_x = mouse_position.value.dx;
    double mouse_position_y = mouse_position.value.dy;



    bool x_compare = left_down_point_x<mouse_position_x && mouse_position_x<right_up_point_x;

    bool y_compare = left_down_point_y>mouse_position_y && mouse_position_y>right_up_point_y;

    if (x_compare && y_compare) {
      is_hover = true;
    }
    return is_hover;
  }
}
