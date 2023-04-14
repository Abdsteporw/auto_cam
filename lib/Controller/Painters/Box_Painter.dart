import 'package:auto_cam/Model/Main_Models/Box_model.dart';
import 'package:auto_cam/Model/Main_Models/Piece_model.dart';
import 'package:auto_cam/Model/Main_Models/Point_model.dart';
import 'package:flutter/material.dart';

class Box_Painter extends CustomPainter {

  late double drawing_scale;
  late Size screen_Size;
  late int hover_id;
  late Box_model box_model;


  Box_Painter( Box_model box_model ,double scale, Size screen_size,int hover_id,Offset m) {
    this.box_model=box_model;
    this.drawing_scale = scale;
    this.screen_Size = screen_size;
    this.hover_id=hover_id;


    box_model.box_origin.x_coordinate =
        screen_size.width / 2 - box_model.box_width * drawing_scale / 2;
    box_model.box_origin.y_coordinate =
        screen_size.height / 2 + box_model.box_height * drawing_scale / 2;

  }

  @override
  void paint(Canvas canvas, Size size) {
    draw_box(canvas);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  draw_box(Canvas canvas) {

    Paint line_painter = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..color = Colors.black;


    Paint pieces_filler = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue[100]!;


    Paint inners_filler = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.teal[100]!;

    for (int i = 0; i < box_model.box_pieces.length; i++) {
      Piece_model piece_model = box_model.box_pieces[i];

      Point_model p1 = piece_model.cordinate_3d.xy_0_plane[0];
      Point_model p2 = piece_model.cordinate_3d.xy_0_plane[1];
      Point_model p3 = piece_model.cordinate_3d.xy_0_plane[2];
      Point_model p4 = piece_model.cordinate_3d.xy_0_plane[3];

      Path path = Path();
      path.moveTo(p1.x_coordinate * drawing_scale+box_model.box_origin.x_coordinate,box_model.box_origin.y_coordinate- p1.y_coordinate * drawing_scale);
      path.lineTo(p2.x_coordinate * drawing_scale+box_model.box_origin.x_coordinate,box_model.box_origin.y_coordinate- p2.y_coordinate * drawing_scale);
      path.lineTo(p3.x_coordinate * drawing_scale+box_model.box_origin.x_coordinate,box_model.box_origin.y_coordinate- p3.y_coordinate * drawing_scale);
      path.lineTo(p4.x_coordinate * drawing_scale+box_model.box_origin.x_coordinate,box_model.box_origin.y_coordinate- p4.y_coordinate * drawing_scale);
      path.lineTo(p1.x_coordinate * drawing_scale+box_model.box_origin.x_coordinate,box_model.box_origin.y_coordinate- p1.y_coordinate * drawing_scale);


      if(piece_model.piece_id==hover_id){

        if(piece_model.piece_name=='inner'){

          canvas.drawPath(path, inners_filler);
          canvas.drawPath(path, line_painter);
        }else{
          canvas.drawPath(path, pieces_filler);
          canvas.drawPath(path, line_painter);
        }

      }else{
        canvas.drawPath(path, line_painter);

      }
    }
  }
}
