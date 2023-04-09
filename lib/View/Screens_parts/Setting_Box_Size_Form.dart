import 'package:auto_cam/View/Main_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Setting_Box_Size_Form extends StatelessWidget {
  GlobalKey<FormState> form_key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form_key,
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),

          //back button and lable
          Row(
            children: [
              //Back button
              Container(
                width: 50,
                child: InkWell(
                  child: Icon(
                    Icons.home,
                    size: 26,
                    color: Colors.teal,
                  ),
                  onTap: () {
                    Get.off(Main_Screen());
                  },
                ),
              ),
              //lable
              Container(
                width: 200,
                child: Center(
                  child: Text(
                    'setting up box size',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),

          //divider
          Container(
            height: 1,
            color: Colors.grey,
          ),

          SizedBox(
            height: 18,
          ),
          //width
          Row(
            children: [
              SizedBox(
                width: 16,
              ),
              Text(
                "Box Width   :",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                width: 100,
                height: 26,
                child: TextFormField(
                  // controller: box_width_controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (d) {
                    if (d!.isEmpty) {
                      return 'please add value';
                    }
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Text(
                "  mm",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),

          //height
          Row(
            children: [
              SizedBox(
                width: 18,
              ),
              Text(
                "Box Height :",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                width: 100,
                height: 26,
                child: TextFormField(
                  // controller: box_height_controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (d) {
                    if (d!.isEmpty) {
                      return 'please add value';
                    }
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Text(
                "  mm",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),

          //depth
          Row(
            children: [
              SizedBox(
                width: 18,
              ),
              Text(
                "Box depth  : ",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                  width: 100,
                  height: 26,
                  child: TextFormField(
                    // controller: box_depth_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (d) {
                      if (d!.isEmpty) {
                        return 'please add value';
                      }
                    },
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  )),
              Text(
                "  mm",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),

          //divider
          Container(
            height: 1,
            color: Colors.grey,
          ),

          SizedBox(
            height: 12,
          ),

          SizedBox(
            width: 18,
          ),

          Text(
            "thickness :",
            style: TextStyle(fontSize: 14),
          ),

          SizedBox(
            height: 12,
          ),

          //material thickness form field
          Row(
            children: [
              SizedBox(
                width: 18,
              ),
              Text(
                "Material      :",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                width: 100,
                height: 26,
                child: TextFormField(
                  // controller: box_thickness_controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (d) {
                    if (d!.isEmpty) {
                      return 'please add value';
                    }
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Text(
                "  mm",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),

          SizedBox(
            height: 12,
          ),

          SizedBox(
            height: 12,
          ),

          //back Panel thickness form field
          Row(
            children: [
              SizedBox(
                width: 18,
              ),
              Text(
                "Back Panel :",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                width: 100,
                height: 26,
                child: TextFormField(
                  // controller: box_thickness_controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (d) {
                    if (d!.isEmpty) {
                      return 'please add value';
                    }
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Text(
                "  mm",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),

          SizedBox(
            height: 16,
          ),

          //divider
          Container(
            height: 1,
            color: Colors.grey,
          ),

          /////////////////
          // Action part (buttons for : draw , export as excel , export as G_code .. )

          SizedBox(
            height: 12,
          ),

          //chose or Edit fitting type
          Container(
            child: Row(
              children: [
                SizedBox(width: 18),
                Container(
                    width: 180,
                    child: Text('chose or Edit fitting type',
                        style: TextStyle(
                          fontSize: 14,
                        ))),
                SizedBox(
                  width: 18,
                ),
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.draw,
                      size: 36,
                      color: Colors.teal,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),

          //divider
          Container(
            height: 1,
            color: Colors.grey,
          ),

          ///////////////////////
          ///////////////////////
          //Draw in the Screen button
          Padding(
            padding: const EdgeInsets.only(
                left: 18.0, right: 52, top: 24, bottom: 24),
            child: InkWell(
              onTap: () {
                valid_and_go(form_key.currentState!.validate());
              },
              child: Container(
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                    child: Text(
                  'Draw in the Screen',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
              ),
            ),
          ),
          ///////////////////////
          ///////////////////////

          Container(
            height: 1,
            color: Colors.grey,
          ),

          SizedBox(
            height: 56,
          ),

          //Export cut list as excel
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 18,
                ),
                Container(
                    width: 180,
                    child: Text('Export cut list as excel ',
                        style: TextStyle(
                          fontSize: 14,
                        ))),
                SizedBox(
                  width: 18,
                ),
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.file_open_rounded,
                      size: 36,
                      color: Colors.teal,
                    )),
              ],
            ),
          ),

          SizedBox(
            height: 22,
          ),

          //Export Details sheets as PDF
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 18,
                ),
                Container(
                    width: 180,
                    child: Text('Details sheets as   PDF ',
                        style: TextStyle(
                          fontSize: 14,
                        ))),
                SizedBox(
                  width: 18,
                ),
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.picture_as_pdf,
                      size: 36,
                      color: Colors.teal,
                    )),
              ],
            ),
          ),

          SizedBox(
            height: 22,
          ),

          //preview Nesting sheets
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 18,
                ),
                Container(
                    width: 180,
                    child: Text('preview Nesting sheets',
                        style: TextStyle(
                          fontSize: 14,
                        ))),
                SizedBox(
                  width: 18,
                ),
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.margin_outlined,
                      size: 36,
                      color: Colors.teal,
                    )),
              ],
            ),
          ),

          SizedBox(
            height: 22,
          ),

          //Export every piece \n  as G_code file
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 18,
                ),
                Container(
                    width: 180,
                    child: Text('Export every piece \n  as G_code file',
                        style: TextStyle(
                          fontSize: 14,
                        ))),
                SizedBox(
                  width: 18,
                ),
                InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.code,
                      size: 36,
                      color: Colors.teal,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // vlidation  method
  void valid_and_go(bool v) {
     print('$v');


  }


}