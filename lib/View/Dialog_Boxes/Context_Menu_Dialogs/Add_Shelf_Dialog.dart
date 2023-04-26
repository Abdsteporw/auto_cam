import 'package:auto_cam/Controller/Draw_Controllers/Draw_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Add_Shelf_Dialog extends StatefulWidget {
  @override
  State<Add_Shelf_Dialog> createState() => _Add_Shelf_DialogState();
}

class _Add_Shelf_DialogState extends State<Add_Shelf_Dialog> {
  TextEditingController Quantity = TextEditingController();

  TextEditingController Front_Gap = TextEditingController();

  TextEditingController Material = TextEditingController();

  TextEditingController Top_proportional = TextEditingController();

  TextEditingController Bottom_proportional = TextEditingController();

  TextEditingController Top_Distance = TextEditingController();

  TextEditingController Bottom_Distance = TextEditingController();

  Draw_Controller drawerController = Get.find();

  bool quantity = true;

  top_changed() {
    double double_top_distance;
    if (Top_Distance.text.toString() != '') {
      double_top_distance = double.parse(Top_Distance.text.toString());
      if (quantity) {
        if (double_top_distance > 0) {
          Bottom_Distance.text =
              '${drawerController.box_repository.box_model.value.box_pieces[drawerController.hover_id].Piece_height - double_top_distance}';
        } else {
          Bottom_Distance.text = '0';
        }
      }
    }

    setState(() {});
  }

  bottom_changed() {

    double double_bottom_distance =
        double.parse(Bottom_Distance.text.toString());
    if (quantity) {
      if (double_bottom_distance > 0) {
        Top_Distance.text =
            '${
                drawerController.box_repository.box_model.value.box_pieces[drawerController.hover_id].Piece_height -
                    double_bottom_distance}';
      } else {

        Top_Distance.text = '0';
      }
    }
    setState(() {});
  }

  add_shelf() {
    double top_Distence = quantity?double.parse(Top_Distance.text.toString()):0;
    double frontage_Gap = double.parse(Front_Gap.text.toString());
    double material = double.parse(Material.text.toString());
    drawerController.add_shelf(top_Distence, frontage_Gap,material,double.parse(Quantity.text.toString()).toInt());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 130,
                child: Column(
                  children: [
                    Container(
                        height: 131,
                        child: Center(
                            child: Text(
                          'Quantity :',
                          style: TextStyle(fontSize: 14),
                        ))),
                    Container(
                      width: 303,
                      height: 1,
                      color: Colors.grey,
                      child: Text(''),
                    ),
                    Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          quantity ? 'proportional' : '',
                          style: TextStyle(fontSize: 14),
                        ))),
                    Container(
                      width: 303,
                      height: 1,
                      color: Colors.grey,
                      child: Text(''),
                    ),
                    Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          quantity?'Distance':'',
                          style: TextStyle(fontSize: 14),
                        ))),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 209,
                color: Colors.grey,
                child: Text(''),
              ),
              Container(
                width: 85,
                child: Column(
                  children: [
                    Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          'Quantity',
                          style: TextStyle(fontSize: 14),
                        ))),
                    Container(
                      width: 303,
                      height: 1,
                      color: Colors.grey,
                      child: Text(''),
                    ),
                    Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          'Front Gap',
                          style: TextStyle(fontSize: 14),
                        ))),
                    Container(
                      width: 303,
                      height: 1,
                      color: Colors.grey,
                      child: Text(''),
                    ),
                    Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          'Material',
                          style: TextStyle(fontSize: 14),
                        ))),
                    Container(
                      width: 303,
                      height: 1,
                      color: Colors.grey,
                      child: Text(''),
                    ),
                    Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          quantity ? 'Top' : '',
                          style: TextStyle(fontSize: 14),
                        ))),
                    Container(
                      width: 303,
                      height: 1,
                      color: Colors.grey,
                      child: Text(''),
                    ),
                    Container(
                        height: 32,
                        child: Center(
                            child: TextFormField(
                          enabled: quantity,
                          controller: Top_proportional,
                        ))),
                    Container(
                      width: 303,
                      height: 1,
                      color: Colors.grey,
                      child: Text(''),
                    ),
                    Container(
                        height: 32,
                        child: Center(
                            child: TextFormField(
                              enabled: quantity,
                          controller: Top_Distance,
                          onChanged: (_) {
                            top_changed();
                          },
                        ))),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 209,
                color: Colors.grey,
                child: Text(''),
              ),
              Container(
                width: 85,
                child: Column(
                  children: [
                    Container(
                        height: 32,
                        child: Center(
                            child: TextFormField(
                          controller: Quantity,
                          onChanged: (_) {
                            if (Quantity.text != '') {
                              if (double.parse(Quantity.text.toString())
                                      .toInt() >
                                  1) {
                                quantity = false;
                                setState(() {});
                              } else {
                                quantity = true;
                                setState(() {});
                              }
                            }
                          },
                        ))),
                    Container(
                      width: 303,
                      height: 1,
                      color: Colors.grey,
                      child: Text(''),
                    ),
                    Container(
                        height: 32,
                        child: Center(
                            child: TextFormField(
                          controller: Front_Gap,
                        ))),
                    Container(
                      width: 303,
                      height: 1,
                      color: Colors.grey,
                      child: Text(''),
                    ),
                    Container(
                        height: 32,
                        child: Center(
                            child: TextFormField(
                          controller: Material,
                        ))),
                    Container(
                      width: 303,
                      height: 1,
                      color: Colors.grey,
                      child: Text(''),
                    ),
                    Container(
                        height: 32,
                        child: Center(
                            child: Text(
                          quantity ? 'Bottom' : '',
                          style: TextStyle(fontSize: 14),
                        ))),
                    Container(
                      width: 303,
                      height: 1,
                      color: Colors.grey,
                      child: Text(''),
                    ),
                    Container(
                        height: 32,
                        child: Center(
                            child: TextFormField(
                          enabled: quantity,
                          controller: Bottom_proportional,
                          onChanged: (_) {
                            bottom_changed();
                          },
                        ))),
                    Container(
                      width: 303,
                      height: 1,
                      color: Colors.grey,
                      child: Text(''),
                    ),
                    Container(
                        height: 32,
                        child: Center(
                            child: TextFormField(
                          enabled: quantity,
                          controller: Bottom_Distance,
                        ))),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 209,
                color: Colors.grey,
                child: Text(''),
              ),
            ],
          ),
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    add_shelf();
                  },
                  child: Container(
                    width: 80,
                    height: 32,
                    child: Center(child: Text('ok')),
                    color: Colors.teal[200],
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(Get.overlayContext!).pop();
                  },
                  child: Container(
                    width: 80,
                    height: 32,
                    child: Center(child: Text('cancle')),
                    color: Colors.redAccent[100],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
