import 'dart:collection';

import 'package:auto_cam/Model/Main_Models/Door_Model.dart';
import 'package:auto_cam/Model/Main_Models/Face_model.dart';
import 'package:auto_cam/Model/Main_Models/Piece_model.dart';
import 'package:auto_cam/Model/Main_Models/Point_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Box_model {
  late int box_id;
  late double box_width;
  late double box_height;
  late double box_depth;
  late double material_thickness;
  late double backpanel_thickness;
  late Point_model box_origin;
  late List<Piece_model> box_pieces;



  Box_model(this.box_width, this.box_height, this.box_depth,
      this.material_thickness, this.backpanel_thickness) {
    box_id = 0;
    box_origin = Point_model(0, 0, 0);
    ////////////////////////////////////////////////////////////////////////////

    /// initiate the details of the box (id,name,size,Pieces)
    /// every piece need also details (id , name , size , faces )

    /// we will  define the thickness of all pieces to use it while we initiate the other pieces
    /// and as more explanation we need to separate this value because maybe one of box side or pieces
    /// has different thickness or even different material

    Map<String, double> pieces_thickness = {
      "top_thickness": material_thickness,
      "base_thickness": material_thickness,
      "right_thickness": material_thickness,
      "left_thickness": material_thickness,
    };

    /// we need to define the id of initiate pieces
    /// note : we consider the main inner or inner area has the id of back panel
    /// and it will always like this , the different id for inner will be for new inners

    ////////////////////////////////////////////////////////////////////////////

    /// 1- initiate the (top) piece of the box
    /// 1-1 initiate the Faces of the top piece

    Single_Face top_Piece_top_face = Single_Face([0], [], []);
    Single_Face top_Piece_right_face = Single_Face([2], [], []);
    Single_Face top_Piece_base_face = Single_Face([3], [], []);
    Single_Face top_Piece_left_face = Single_Face([4], [], []);
    Single_Face top_Piece_front_face = Single_Face([0], [], []);
    Single_Face top_Piece_back_face = Single_Face([0], [], []);

    Face_model top_faces = Face_model(
        top_Piece_top_face,
        top_Piece_right_face,
        top_Piece_base_face,
        top_Piece_left_face,
        top_Piece_front_face,
        top_Piece_back_face);

    ///1-2 initiate the top piece itself
    Piece_model top_piece = Piece_model(
        // 1,
        'top',
        'H',
        'box_material',
        box_depth,
        box_width - 2 * material_thickness,
        material_thickness,
        Point_model(
            box_origin.x_coordinate + pieces_thickness['left_thickness']!,
            box_origin.y_coordinate +
                box_height -
                pieces_thickness['top_thickness']!,
            0),
        top_faces);

    ////////////////////////////////////////////////////////////////////////////

    /// 2- initiate the (right) piece of the box
    /// 2-1 initiate the Faces of the right piece
    ///

    Single_Face right_Piece_top_face = Single_Face([0], [], []);
    Single_Face right_Piece_right_face = Single_Face([0], [], []);
    Single_Face right_Piece_base_face = Single_Face([0], [], []);
    Single_Face right_Piece_left_face = Single_Face([1, 5, 3], [], []);
    Single_Face right_Piece_front_face = Single_Face([0], [], []);
    Single_Face right_Piece_back_face = Single_Face([0], [], []);

    Face_model right_faces = Face_model(
        right_Piece_top_face,
        right_Piece_right_face,
        right_Piece_base_face,
        right_Piece_left_face,
        right_Piece_front_face,
        right_Piece_back_face);

    ///2-2 initiate the right piece itself
    Piece_model right_piece = Piece_model(
        // 2,
        'right',
        'V',
        'box_material',
        box_depth,
        box_height,
        material_thickness,
        Point_model(
            box_origin.x_coordinate +
                box_width -
                pieces_thickness['right_thickness']!,
            box_origin.y_coordinate,
            0),
        right_faces);

    ////////////////////////////////////////////////////////////////////////////

    /// 3- initiate the (left) piece of the box
    /// 3-1 initiate the Faces of the left piece

    Single_Face left_Piece_top_face = Single_Face([0], [], []);
    Single_Face left_Piece_right_face = Single_Face([1, 5,3], [], []);
    Single_Face left_Piece_base_face = Single_Face([0], [], []);
    Single_Face left_Piece_left_face = Single_Face([0], [], []);
    Single_Face left_Piece_front_face = Single_Face([0], [], []);
    Single_Face left_Piece_back_face = Single_Face([0], [], []);

    Face_model left_faces = Face_model(
        left_Piece_top_face,
        left_Piece_right_face,
        left_Piece_base_face,
        left_Piece_left_face,
        left_Piece_front_face,
        left_Piece_back_face);

    ///3-2 initiate the left piece itself
    Piece_model left_piece = Piece_model(
        // 4,
        'left',
        'V',
        'box_material',
        box_depth,
        box_height,
        material_thickness,
        Point_model(box_origin.x_coordinate, box_origin.y_coordinate, 0),
        left_faces);

    ////////////////////////////////////////////////////////////////////////////

    /// 4- initiate the (base) piece of the box
    /// 4-1 initiate the Faces of the base piece

    Single_Face base_Piece_top_face = Single_Face([5], [], []);
    Single_Face base_Piece_right_face = Single_Face([2], [], []);
    Single_Face base_Piece_base_face = Single_Face([0], [], []);
    Single_Face base_Piece_left_face = Single_Face([4], [], []);
    Single_Face base_Piece_front_face = Single_Face([0], [], []);
    Single_Face base_Piece_back_face = Single_Face([0], [], []);

    Face_model base_faces = Face_model(
        base_Piece_top_face,
        base_Piece_right_face,
        base_Piece_base_face,
        base_Piece_left_face,
        base_Piece_front_face,
        base_Piece_back_face);

    ///4-2 initiate the base piece itself
    Piece_model base_piece = Piece_model(
        // 3,
        'base',
        'H',
        'box_material',
        box_depth,
        box_width - 2 * material_thickness,
        material_thickness,
        Point_model(
            box_origin.x_coordinate + pieces_thickness['left_thickness']!,
            box_origin.y_coordinate,
            0),
        base_faces);

    ////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////

    /// 5- initiate the (back_panel) piece of the box
    /// 5-1 initiate the Faces of the back_panel piece

    Single_Face back_panel_Piece_top_face = Single_Face([1], [], []);
    Single_Face back_panel_Piece_right_face = Single_Face([2], [], []);
    Single_Face back_panel_Piece_base_face = Single_Face([3], [], []);
    Single_Face back_panel_Piece_left_face = Single_Face([4], [], []);
    Single_Face back_panel_Piece_front_face = Single_Face([0], [], []);
    Single_Face back_panel_Piece_back_face = Single_Face([0], [], []);

    Face_model back_panel_faces = Face_model(
        back_panel_Piece_top_face,
        back_panel_Piece_right_face,
        back_panel_Piece_base_face,
        back_panel_Piece_left_face,
        back_panel_Piece_front_face,
        back_panel_Piece_back_face);

    ///5-2 initiate the base piece itself
    Piece_model back_panel_piece = Piece_model(
        // 0,
        'back_panel',
        'F',
        'back_panel_id_material',

        100  ,
        100 ,

        backpanel_thickness,
        Point_model(
            box_origin.x_coordinate + 9, box_origin.y_coordinate + 9, 0),
        back_panel_faces);

    ////////////////////////////////////////////////////////////////////////////

    /// 6- initiate the (main inner) piece of the box
    /// 6-1 initiate the Faces of the inner piece

    Single_Face inner_Piece_top_face = Single_Face([1], [], []);
    Single_Face inner_Piece_right_face = Single_Face([2], [], []);
    Single_Face inner_Piece_base_face = Single_Face([3], [], []);
    Single_Face inner_Piece_left_face = Single_Face([4], [], []);
    Single_Face inner_Piece_front_face = Single_Face([0], [], []);
    Single_Face inner_Piece_back_face = Single_Face([0], [], []);

    Face_model inner_panel_faces = Face_model(
      inner_Piece_top_face,
      inner_Piece_right_face,
      inner_Piece_base_face,
      inner_Piece_left_face,
      inner_Piece_front_face,
      inner_Piece_back_face,
    );

    ///6-2 initiate the inner piece itself
    Piece_model inner_piece = Piece_model(
        // 5,
        'inner',
        'F',
        'inner_id_material',
        box_width - material_thickness*2,
        box_height - material_thickness*2,
        backpanel_thickness,
        Point_model(
            box_origin.x_coordinate + material_thickness, box_origin.y_coordinate + material_thickness, 0),
        inner_panel_faces);

    ////////////////////////////////////////////////////////////////////////////

    box_pieces = [];
    box_pieces.add(back_panel_piece);
    box_pieces.add(top_piece);
    box_pieces.add(right_piece);
    box_pieces.add(base_piece);
    box_pieces.add(left_piece);
    box_pieces.add(inner_piece);

    box_pieces[0] = Piece_model(
      // 0,
        '\npack panel',
        'F',
        'back_panel_id_material',

        box_pieces[5].Piece_width+18  ,
        box_pieces[5].Piece_height+18 ,

        backpanel_thickness,
        Point_model(
            box_pieces[5].piece_origin.x_coordinate - 9, box_pieces[5].piece_origin.y_coordinate - 9, 0),
        back_panel_faces);



  }

  add_Shelf_pattern(int inner, double top_Distence, double frontage_Gap, double material_thickness)

  {

    double down_Distence = box_pieces[inner].Piece_height - top_Distence - material_thickness;

    double depth_of_shelf = box_depth - 24 - frontage_Gap;

    int id_reference=box_pieces.length-1;
    int new_piece_id=id_reference+1;
    int new_inner_id=id_reference+2;

    Face_model old_inner_face = box_pieces[inner].piece_faces;

    Piece_model old_inner = Piece_model(
        // id_reference,
        'inner',
        'F',
        'inner',
        box_pieces[inner].Piece_width,
        top_Distence,
        10,
        Point_model(
            box_pieces[inner].piece_origin.x_coordinate,
            box_pieces[inner].piece_origin.y_coordinate + down_Distence + material_thickness,
            box_pieces[inner].piece_origin.z_coordinate),
        old_inner_face);

    Piece_model new_inner = Piece_model(
        // new_inner_id,
        'inner',
        'F',
        'inner',
        box_pieces[inner].Piece_width,
        down_Distence,
        10,
        Point_model(
            box_pieces[inner].piece_origin.x_coordinate,
            box_pieces[inner].piece_origin.y_coordinate,
            box_pieces[inner].piece_origin.z_coordinate),
        old_inner_face);

    Single_Face new_Piece_top_face   = Single_Face([id_reference], [], []);
    Single_Face new_Piece_right_face = box_pieces[inner].piece_faces.right_face;
    Single_Face new_Piece_base_face  = Single_Face([new_inner_id], [], []);
    Single_Face new_Piece_left_face  = box_pieces[inner].piece_faces.left_face;
    Single_Face new_Piece_front_face = Single_Face([1], [], []);
    Single_Face new_Piece_back_face  = Single_Face([0], [], []);

    Face_model new_piece_faces = Face_model(
        new_Piece_top_face,
        new_Piece_right_face,
        new_Piece_base_face,
        new_Piece_left_face,
        new_Piece_front_face,
        new_Piece_back_face);

    Piece_model new_piece = Piece_model(
        // new_piece_id,
        'new shelf',
        'H',
        'material_name',
        depth_of_shelf,
        box_pieces[inner].Piece_width,
        material_thickness,
        Point_model(
            box_pieces[inner].piece_origin.x_coordinate,
            box_pieces[inner].piece_origin.y_coordinate + down_Distence,
            box_pieces[inner].piece_origin.z_coordinate),
        new_piece_faces);


    box_pieces.removeAt(inner);

    box_pieces.add(old_inner);
    box_pieces.add(new_piece);
    box_pieces.add(new_inner);

    old_inner.piece_faces.base_face = Single_Face([new_piece_id], [], []);
    new_inner.piece_faces.top_face = Single_Face([new_piece_id], [], []);



  }

  add_Shelf(int inner, double top_Distence, double frontage_Gap, double material_thickness,int Quantity)
  {
    if(Quantity==1){
      if(box_pieces[inner].Piece_height>top_Distence && top_Distence>0)
      {
        add_Shelf_pattern(
            inner, top_Distence, frontage_Gap, material_thickness);
        Navigator.of(Get.overlayContext!).pop();
      }
      else{
        Get.defaultDialog(title: 'Error',content: Text('you enter wrong value , please check again'));
      }
    }

    else{
      if(((Quantity-1)*top_Distence+Quantity*material_thickness)<box_pieces[inner].Piece_height){
        double distance=(box_pieces[inner].Piece_height-Quantity*material_thickness)/(Quantity+1);

        for(int i=0;i<Quantity;i++){
          if(i==0)
          add_Shelf_pattern(inner, distance, frontage_Gap, material_thickness);
          else
            add_Shelf_pattern(box_pieces.length-1, distance, frontage_Gap, material_thickness);


        }
        Navigator.of(Get.overlayContext!).pop();


      }else{
        Get.defaultDialog(title: 'Error',content: Text('you enter wrong value , please check again'));
      }

    }

  }



  /// Partition
  add_partition_pattern(int inner, double left_Distence, double frontage_Gap, double material_thickness)
  {

    double right_Distence = box_pieces[inner].Piece_width - left_Distence - material_thickness;

    double depth_of_partition = box_depth - 24 - frontage_Gap;

    int id_reference=box_pieces.length-1;
    int new_piece_id=id_reference+1;
    int new_inner_id=id_reference+2;

    Face_model old_inner_face = box_pieces[inner].piece_faces;

    Piece_model old_inner = Piece_model(
      // id_reference,
        'inner',
        'F',
        'inner',
        left_Distence,
        box_pieces[inner].Piece_height,
        10,
        Point_model(
            box_pieces[inner].piece_origin.x_coordinate,
            box_pieces[inner].piece_origin.y_coordinate ,
            box_pieces[inner].piece_origin.z_coordinate),
        old_inner_face);

    Piece_model new_inner = Piece_model(
      // new_inner_id,
        'inner',
        'F',
        'inner',
        left_Distence,
        box_pieces[inner].Piece_height,

        10,
        Point_model(
            box_pieces[inner].piece_origin.x_coordinate+ left_Distence + material_thickness,
            box_pieces[inner].piece_origin.y_coordinate,
            box_pieces[inner].piece_origin.z_coordinate),
        old_inner_face);

    Single_Face new_Piece_top_face   = box_pieces[inner].piece_faces.top_face;
    Single_Face new_Piece_right_face =  Single_Face([id_reference], [], []);
    Single_Face new_Piece_base_face  = box_pieces[inner].piece_faces.base_face;
    Single_Face new_Piece_left_face  = Single_Face([new_inner_id], [], []);
    Single_Face new_Piece_front_face = Single_Face([1], [], []);
    Single_Face new_Piece_back_face  = Single_Face([0], [], []);

    Face_model new_piece_faces = Face_model(
        new_Piece_top_face,
        new_Piece_right_face,
        new_Piece_base_face,
        new_Piece_left_face,
        new_Piece_front_face,
        new_Piece_back_face);

    Piece_model new_piece = Piece_model(
      // new_piece_id,
        'new shelf',
        'V',
        'material_name',

        depth_of_partition,
        box_pieces[inner].Piece_height,
        material_thickness,
        Point_model(
            box_pieces[inner].piece_origin.x_coordinate+left_Distence,
            box_pieces[inner].piece_origin.y_coordinate ,
            box_pieces[inner].piece_origin.z_coordinate),
        new_piece_faces);


    box_pieces.removeAt(inner);

    box_pieces.add(old_inner);
    box_pieces.add(new_piece);
    box_pieces.add(new_inner);

    old_inner.piece_faces.base_face = Single_Face([new_piece_id], [], []);
    new_inner.piece_faces.top_face = Single_Face([new_piece_id], [], []);



  }

  add_partation(int inner, double left_Distence, double frontage_Gap, double material_thickness,int Quantity)
  {
    if(Quantity==1){
      if(box_pieces[inner].Piece_width>left_Distence && left_Distence>0)
      {
        add_partition_pattern(
            inner, left_Distence, frontage_Gap, material_thickness);
        Navigator.of(Get.overlayContext!).pop();
      }
      else{
        Get.defaultDialog(title: 'Error',content: Text('you enter wrong value , please check again'));
      }
    }

    else{
      if(((Quantity-1)*left_Distence+Quantity*material_thickness)<box_pieces[inner].Piece_width){
        double distance=(box_pieces[inner].Piece_width-Quantity*material_thickness)/(Quantity+1);

        for(int i=0;i<Quantity;i++){
          if(i==0)
            add_partition_pattern(inner, distance, frontage_Gap, material_thickness);
          else
            add_partition_pattern(box_pieces.length-1, distance, frontage_Gap, material_thickness);

        }
        Navigator.of(Get.overlayContext!).pop();


      }else{
        Get.defaultDialog(title: 'Error',content: Text('you enter wrong value , please check again'));
      }

    }
  }



  add_door(Door_Model door_model){

    if(door_model.single_door){
      add_single_Door(door_model);
    }else{
      add_double_Door( door_model);
    }

  }
  add_single_Door(Door_Model door_model)
  {


    double out_width_of_inner=box_pieces[door_model.inner_id].Piece_width+
        box_pieces[box_pieces[door_model.inner_id].piece_faces.left_face.face_item.first].Piece_thickness*door_model.left_over_lap+
        box_pieces[box_pieces[door_model.inner_id].piece_faces.right_face.face_item.first].Piece_thickness*door_model.right_over_lap
    ;

    double out_hight_of_inner=box_pieces[door_model.inner_id].Piece_height+
        box_pieces[box_pieces[door_model.inner_id].piece_faces.top_face.face_item.first].Piece_thickness*door_model.up_over_lap+
        box_pieces[box_pieces[door_model.inner_id].piece_faces.base_face.face_item.first].Piece_thickness*door_model.down_over_lap
    ;


    Single_Face new_door_top_face   = box_pieces[door_model.inner_id].piece_faces.top_face;
    Single_Face new_door_right_face = box_pieces[door_model.inner_id].piece_faces.right_face;
    Single_Face new_door_base_face  = box_pieces[door_model.inner_id].piece_faces.base_face;
    Single_Face new_door_left_face  = box_pieces[door_model.inner_id].piece_faces.left_face;
    Single_Face new_door_front_face = Single_Face([1], [], []);
    Single_Face new_door_back_face  = Single_Face([0], [], []);

    Face_model new_piece_faces = Face_model(
       new_door_top_face  ,
       new_door_right_face,
       new_door_base_face ,
       new_door_left_face ,
       new_door_front_face,
       new_door_back_face );

    Piece_model new_door = Piece_model(
      // new_piece_id,
        'Door',
        'F',
        'material_name',
        out_width_of_inner-door_model.round_gap*2,
        out_hight_of_inner-door_model.round_gap*2,
        material_thickness,
        Point_model(
            box_pieces[door_model.inner_id].piece_origin.x_coordinate-(box_pieces[box_pieces[door_model.inner_id]
                .piece_faces.left_face.face_item.first].Piece_thickness)*door_model.left_over_lap+door_model.round_gap,
            box_pieces[door_model.inner_id].piece_origin.y_coordinate-(box_pieces[box_pieces[door_model.inner_id]
                .piece_faces.base_face.face_item.first].Piece_thickness)*door_model.down_over_lap +door_model.round_gap,
            box_pieces[door_model.inner_id].piece_origin.z_coordinate),
        new_piece_faces);

    box_pieces.add(new_door);

  }

  add_double_Door(Door_Model door_model)
  {

    double out_width_of_inner=box_pieces[door_model.inner_id].Piece_width+
        box_pieces[box_pieces[door_model.inner_id].piece_faces.left_face.face_item.first].Piece_thickness*door_model.left_over_lap+
        box_pieces[box_pieces[door_model.inner_id].piece_faces.right_face.face_item.first].Piece_thickness*door_model.right_over_lap
    ;

    double out_hight_of_inner=box_pieces[door_model.inner_id].Piece_height+
        box_pieces[box_pieces[door_model.inner_id].piece_faces.top_face.face_item.first].Piece_thickness*door_model.up_over_lap+
        box_pieces[box_pieces[door_model.inner_id].piece_faces.base_face.face_item.first].Piece_thickness*door_model.down_over_lap
    ;


    int left_door_id=box_pieces.length+1;
    int right_door_id=box_pieces.length+2;


    Single_Face left_door_top_face   = box_pieces[door_model.inner_id].piece_faces.top_face;
    Single_Face left_door_right_face = Single_Face([right_door_id], [], []);
    Single_Face left_door_base_face  = box_pieces[door_model.inner_id].piece_faces.base_face;
    Single_Face left_door_left_face  = box_pieces[door_model.inner_id].piece_faces.left_face;
    Single_Face left_door_front_face = Single_Face([1], [], []);
    Single_Face left_door_back_face  = Single_Face([0], [], []);


    Face_model left_door_faces = Face_model(
        left_door_top_face   ,
        left_door_right_face ,
        left_door_base_face  ,
        left_door_left_face  ,
        left_door_front_face ,
        left_door_back_face  ,
    );


    Piece_model left_door = Piece_model(
      // new_piece_id,
        'Door',
        'F',
        'material_name',
        out_width_of_inner/2-door_model.round_gap*2,
        out_hight_of_inner-door_model.round_gap*2,
        material_thickness,
        Point_model(
            box_pieces[door_model.inner_id].piece_origin.x_coordinate-(box_pieces[box_pieces[door_model.inner_id].piece_faces.left_face.face_item.first].
            Piece_thickness)*door_model.left_over_lap+door_model.round_gap,
            box_pieces[door_model.inner_id].piece_origin.y_coordinate-(box_pieces[box_pieces[door_model.inner_id].piece_faces.base_face.face_item.first].
            Piece_thickness)*door_model.down_over_lap +door_model.round_gap,
            box_pieces[door_model.inner_id].piece_origin.z_coordinate),
        left_door_faces);

    box_pieces.add(left_door);



    /// RIGHT DOOR
    Single_Face right_door_top_face   = box_pieces[door_model.inner_id].piece_faces.top_face;
    Single_Face right_door_right_face = box_pieces[door_model.inner_id].piece_faces.right_face;
    Single_Face right_door_base_face  = box_pieces[door_model.inner_id].piece_faces.base_face;
    Single_Face right_door_left_face  =  Single_Face([left_door_id], [], []);
    Single_Face right_door_front_face = Single_Face([1], [], []);
    Single_Face right_door_back_face  = Single_Face([0], [], []);

    Face_model right_door_faces = Face_model(
      right_door_top_face   ,
      right_door_right_face ,
      right_door_base_face  ,
      right_door_left_face  ,
      right_door_front_face ,
      right_door_back_face  ,
    );

    Piece_model right_door = Piece_model(
      // new_piece_id,
        'Door',
        'F',
        'material_name',
        out_width_of_inner/2-door_model.round_gap*2,
        out_hight_of_inner-door_model.round_gap*2,
        material_thickness,
        Point_model(
            box_pieces[door_model.inner_id].piece_origin.x_coordinate-(box_pieces[box_pieces[door_model.inner_id].piece_faces.left_face.face_item.first].
            Piece_thickness)+out_width_of_inner/2+door_model.round_gap,
            box_pieces[door_model.inner_id].piece_origin.y_coordinate-(box_pieces[box_pieces[door_model.inner_id].piece_faces.base_face.face_item.first].
            Piece_thickness) +door_model.round_gap,
            box_pieces[door_model.inner_id].piece_origin.z_coordinate),
        right_door_faces);

    box_pieces.add(right_door);



  }



  Add_Drawer() {}


}
