import 'package:auto_cam/View/Dialog_Boxes/Context_Menu_Dialogs/Add_Shelf_Dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Main_Edit_Dialog extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(Get.overlayContext!).pop();
              Get.defaultDialog(
                  title: 'add shelf',
                  content: Add_Shelf_Dialog()
              );            },
            child: Text(
              'Add Shelf',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              height: 1,
              color: Colors.blueGrey,
            ),
          ),
          InkWell(
            onTap: () {
            },
            child: Text(
              'Add Partition',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              height: 1,
              color: Colors.blueGrey,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Add Drawer',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              height: 1,
              color: Colors.blueGrey,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Add Door',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
