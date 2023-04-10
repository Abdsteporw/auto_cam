import 'package:auto_cam/Controller/Draw_Controllers/Draw_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Drawing_Screen extends StatelessWidget {

  Draw_Controller draw_controller =Get.find();

  @override
  Widget build(BuildContext context) {

    draw_controller.screen_size.value=MediaQuery.of(context).size;

    return Container(
      child: GestureDetector(

        onPanUpdate: (d){
        },
        onLongPress: (){},
        child: Obx(
              () => CustomPaint(
            painter: draw_controller.draw_Box(),

                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Container(),
                ),
          ),
        ),

      ),
    );
  }
}
