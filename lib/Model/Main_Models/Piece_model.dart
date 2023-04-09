
import 'package:auto_cam/Model/Main_Models/Face_model.dart';
import 'package:auto_cam/Model/Main_Models/Point_model.dart';

class Piece_model{

  late int    piece_id;
  late String name;
  late String material_name;

  late double Piece_width;
  late double Piece_height;
  late double Piece_thickness;

  late Point_model      piece_origin;
  late List<Face_model> piece_faces;

  Piece_model(

      this.piece_id,
      this.name,
      this.material_name,
      this.Piece_width,
      this.Piece_height,
      this.Piece_thickness,
      this.piece_origin,
      this.piece_faces

      );

}