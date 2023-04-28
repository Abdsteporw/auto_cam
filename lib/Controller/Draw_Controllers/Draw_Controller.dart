import 'dart:ui';

import 'package:auto_cam/Controller/Painters/Box_Painter.dart';
import 'package:auto_cam/Controller/Repositories_Controllers/Box_Repository.dart';
import 'package:auto_cam/Model/Main_Models/Box_model.dart';
import 'package:auto_cam/Model/Main_Models/Coordinate_3D.dart';
import 'package:auto_cam/Model/Main_Models/Door_Model.dart';
import 'package:auto_cam/Model/Main_Models/Piece_model.dart';
import 'package:auto_cam/Model/Main_Models/Point_model.dart';
import 'package:auto_cam/View/Dialog_Boxes/Context_Menu_Dialogs/Main_Edit_Dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Draw_Controller extends GetxController {

  RxDouble drawing_scale = (0.8).obs;
  Rx<Size> screen_size = Size(800, 600).obs;
  Rx<Offset> mouse_position = Offset(0, 0).obs;

  Box_Repository box_repository = Get.find();
  int hover_id = 90;

  Draw_Controller() {
    // print('DRaw ..... here ########################');
  }

  Box_model get_box() {
    return box_repository.box_model.value;
  }

  Box_Painter draw_Box() {

    Box_model box_model = get_box() ;
    double w = screen_size.value.width - 300;
    hover_id_find(box_model);
    Box_Painter boxPainter = Box_Painter(box_model, drawing_scale.value,
        Size(w, screen_size.value.height), hover_id);
    return boxPainter;
  }

  add_Box(Box_model box_model) {
    box_repository.box_model.value = box_model;
    draw_Box();
  }

  /// here tow method :
  /// 1-hover_id_finder :
  ///      to loop around box pieces and heck if the mouse cursor is hover on using the second method
  /// 2-check_position :
  ///      this method will receive one piece model and check if cursor hover on it .

  /// the first one :
  hover_id_find(Box_model box_model) {
    Point_model my_origin = box_model.box_origin;
    List<Piece_model> box_pieces = box_model.box_pieces;

    hover_id = 100;
    for (int i = 0; i < box_pieces.length; i++) {
      Piece_model p = box_pieces[i];
      if (p.piece_name == 'back_panel') {
        continue;
      } else if (check_position(p, my_origin)) {
        hover_id = i;
      }
    }

  }

  ///the second one :
  bool check_position(Piece_model p, Point_model my_origin) {
    bool is_hover = false;

    Cordinate_3D cordinate_3d = p.cordinate_3d;

    List<Point_model> piece_points = cordinate_3d.xy_0_plane;

    double left_down_point_x = (my_origin.x_coordinate +
        piece_points[0].x_coordinate * drawing_scale.value);
    double left_down_point_y = (my_origin.y_coordinate -
        piece_points[0].y_coordinate * drawing_scale.value);

    double right_up_point_x = (my_origin.x_coordinate +
        piece_points[2].x_coordinate * drawing_scale.value);
    double right_up_point_y = (my_origin.y_coordinate -
        piece_points[2].y_coordinate * drawing_scale.value);

    double mouse_position_x = mouse_position.value.dx;
    double mouse_position_y = mouse_position.value.dy;

    bool x_compare = left_down_point_x < mouse_position_x &&
        mouse_position_x < right_up_point_x;

    bool y_compare = left_down_point_y > mouse_position_y &&
        mouse_position_y > right_up_point_y;

    if (x_compare && y_compare) {
      is_hover = true;
    }
    return is_hover;
  }

  add_shelf(
      double top_Distence, double frontage_Gap, double material_thickness,int quantity)
  {
    box_repository.box_model.value.add_Shelf(hover_id, top_Distence, frontage_Gap, material_thickness,quantity);
    print_pieces_coordinate();

  }

  add_partition(
      double top_Distence, double frontage_Gap, double material_thickness,int quantity)
  {
    box_repository.box_model.value.add_partation(hover_id, top_Distence, frontage_Gap, material_thickness,quantity);
    print_pieces_coordinate();

  }


  String minu_title()
  {
    String dialogs_titles = '';

    if (!(hover_id == 100)) {
      if (box_repository.box_model.value.box_pieces[hover_id].piece_name == 'inner') {
        dialogs_titles = 'Edit Box';
      } else {
        dialogs_titles = 'Edit Piece';
      }
    } else {
      dialogs_titles = 'properties';
    }
    return dialogs_titles;
  }

  Widget Context_Menu()
  {
    late Widget my_widget;

    if (!(hover_id == 100)) {
      if (box_repository.box_model.value.box_pieces[hover_id].piece_name ==
          'inner') {
        my_widget = Main_Edit_Dialog();
      } else {
        my_widget = Container(
          child: Text('pieces menu'),
        );
      }
    } else {
      my_widget = Container(
        child: Text('general menu'),
      );
    }

    return my_widget;
  }


  add_door(Door_Model door_model){
    door_model.inner_id=hover_id;
    box_repository.box_model.value.add_door(door_model);
  }



  print_pieces_coordinate() {

    for (int i = 0; i < box_repository.box_model.value.box_pieces.length; i++) {
      print(' piece id :${i}');
      print(' piece name  :${box_repository.box_model.value.box_pieces[i].piece_name}');

      print('p L D : X${box_repository.box_model.value.box_pieces[i].cordinate_3d.xy_0_plane[0].x_coordinate} , Y:${box_repository.box_model.value.box_pieces[i].cordinate_3d.xy_0_plane[0].y_coordinate}');
      print('p L U : X${box_repository.box_model.value.box_pieces[i].cordinate_3d.xy_0_plane[1].x_coordinate} , Y:${box_repository.box_model.value.box_pieces[i].cordinate_3d.xy_0_plane[1].y_coordinate}');
      print('p R U : X${box_repository.box_model.value.box_pieces[i].cordinate_3d.xy_0_plane[2].x_coordinate} , Y:${box_repository.box_model.value.box_pieces[i].cordinate_3d.xy_0_plane[2].y_coordinate}');
      print('p R D : X${box_repository.box_model.value.box_pieces[i].cordinate_3d.xy_0_plane[3].x_coordinate} , Y:${box_repository.box_model.value.box_pieces[i].cordinate_3d.xy_0_plane[3].y_coordinate}');
      print('height :  ${box_repository.box_model.value.box_pieces[i].Piece_height}');
      print('width :  ${box_repository.box_model.value.box_pieces[i].Piece_width}');
      print('=============');
    }
  }



}
