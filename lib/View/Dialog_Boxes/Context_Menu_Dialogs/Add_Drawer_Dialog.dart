import 'package:auto_cam/Controller/Draw_Controllers/Draw_Controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Add_Drawer_Dialog extends StatelessWidget {


  TextEditingController drawer_box_material_thickness =TextEditingController();
  TextEditingController drawer_box_height             =TextEditingController();
  TextEditingController drawer_box_depth              =TextEditingController();
  TextEditingController drawer_quantity              =TextEditingController();

  Draw_Controller draw_controller=Get.find();

  int drawer_type=1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,height:500,
      child: Column(children:
      [
        Row(
          children: [
            Text('Material thickness '),
            SizedBox(
              width: 12,
            ),
            Container(
              width: 80,
              height: 30,
              child: TextFormField(
                onChanged: (_) {
                  // bottom_changed();
                },
                enabled: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: drawer_box_material_thickness,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                validator: (d) {
                  if (d!.isEmpty) {
                    return 'add value please';
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 6,),
        Row(
          children: [
            Text('Drawer side height:'),
            SizedBox(
              width: 12,
            ),
            Container(
              width: 80,
              height: 30,
              child: TextFormField(
                onChanged: (_) {
                  // bottom_changed();
                },
                enabled: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: drawer_box_height,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                validator: (d) {
                  if (d!.isEmpty) {
                    return 'add value please';
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 6,),
        Row(
          children: [
            Text('Drawer side depth :'),
            SizedBox(
              width: 12,
            ),
            Container(
              width: 80,
              height: 30,
              child: TextFormField(
                onChanged: (_) {
                  // bottom_changed();
                },
                enabled: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: drawer_box_depth,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                validator: (d) {
                  if (d!.isEmpty) {
                    return 'add value please';
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 6,),
        Row(
          children: [
            Text('Drawers quantity :'),
            SizedBox(
              width: 12,
            ),
            Container(
              width: 80,
              height: 30,
              child: TextFormField(
                onChanged: (_) {
                  // bottom_changed();
                },
                enabled: true,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                controller: drawer_quantity,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                validator: (d) {
                  if (d!.isEmpty) {
                    return 'add value please';
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 6,),
        InkWell(
          onTap: (){

            double  double_drawer_box_material_thickness=double.parse( drawer_box_material_thickness.text.toString());
            double  double_drawer_box_height            =double.parse( drawer_box_height            .text.toString());
            double  double_drawer_box_depth             =double.parse( drawer_box_depth             .text.toString());
            int  double_drawer_quantity            =double.parse( drawer_quantity             .text.toString()).toInt();

            draw_controller.add_drawer(
                double_drawer_box_material_thickness,
                double_drawer_box_height,
                double_drawer_box_depth,
                drawer_type,double_drawer_quantity
            );
          },
          child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(6) , color: Colors.teal),
            width: 80,height:40,child: Center(child: Text('ok',style: TextStyle(fontSize: 14),)),
          ),
        ),

      ],
      ),
    );
  }
}
