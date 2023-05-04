class Door_Model{
  late bool single_door;
  late double material_thickness;
  late double round_gap;
  late int inner_id;

  late double up_over_lap;
  late double right_over_lap;
  late double down_over_lap;
  late double left_over_lap;

  Door_Model(this.single_door,this.material_thickness,this.round_gap, this.up_over_lap, this.right_over_lap,
      this.down_over_lap, this.left_over_lap);
}