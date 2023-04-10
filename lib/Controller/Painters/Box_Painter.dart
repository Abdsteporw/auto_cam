import 'package:auto_cam/Controller/Repositories_Controllers/Box_Repository.dart';
import 'package:auto_cam/Model/Main_Models/Box_model.dart';
import 'package:auto_cam/Model/Main_Models/Piece_model.dart';
import 'package:auto_cam/Model/Main_Models/Point_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Box_Painter extends CustomPainter {
  Box_Repository box_repository = Get.find();

  late Box_model box_model;
  late double drawing_scale;
  late Size screen_Size;

  Box_Painter(double scale, Size screen_size) {
    box_model = box_repository.box_model;
    this.drawing_scale = scale;
    this.screen_Size = screen_size;

    box_model.box_origin.x_coordinate =
        screen_size.width / 2 - box_model.box_width * drawing_scale / 2;
    box_model.box_origin.y_coordinate =
        screen_size.height / 2 - box_model.box_height * drawing_scale / 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    draw_box(canvas);

    /// test
    canvas.drawCircle(
        Offset(screen_Size.width / 2, screen_Size.height / 2),
        drawing_scale,
        Paint()
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke);

    ///
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  draw_box(Canvas canvas) {
    Paint paint = Paint()
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..color = Colors.black;

    for (int i = 0; i < box_model.box_pieces.length; i++) {
      Piece_model piece_model = box_model.box_pieces[i];

      Point_model p1 = piece_model.cordinate_3d.xy_0_plane[0];
      Point_model p2 = piece_model.cordinate_3d.xy_0_plane[1];
      Point_model p3 = piece_model.cordinate_3d.xy_0_plane[2];
      Point_model p4 = piece_model.cordinate_3d.xy_0_plane[3];

      Path path = Path();
      path.moveTo(p1.x_coordinate * drawing_scale+box_model.box_origin.x_coordinate, p1.y_coordinate * drawing_scale+box_model.box_origin.y_coordinate);
      path.lineTo(p2.x_coordinate * drawing_scale+box_model.box_origin.x_coordinate, p2.y_coordinate * drawing_scale+box_model.box_origin.y_coordinate);
      path.lineTo(p3.x_coordinate * drawing_scale+box_model.box_origin.x_coordinate, p3.y_coordinate * drawing_scale+box_model.box_origin.y_coordinate);
      path.lineTo(p4.x_coordinate * drawing_scale+box_model.box_origin.x_coordinate, p4.y_coordinate * drawing_scale+box_model.box_origin.y_coordinate);
      path.lineTo(p1.x_coordinate * drawing_scale+box_model.box_origin.x_coordinate, p1.y_coordinate * drawing_scale+box_model.box_origin.y_coordinate);

      canvas.drawPath(path, paint);
    }
  }
}
