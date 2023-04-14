import 'package:auto_cam/Controller/Draw_Controllers/Draw_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Drawing_Screen extends StatelessWidget {
  Draw_Controller draw_controller = Get.find();
  late double w;
  late double h;

  Drawing_Screen(this.w);

  @override
  Widget build(BuildContext context) {
    draw_controller.screen_size.value = MediaQuery.of(context).size;

    return Container(
      child: GestureDetector(
        onScaleUpdate: (d) {
          draw_controller.drawing_scale.value = d.scale;
        },
        onLongPress: () {
          Get.defaultDialog(
              title: "Edit Menu",
              content: draw_controller.Context_Menu()
          );
        },
        child: MouseRegion(
          onHover: (d) {
            draw_controller.mouse_position.value = d.localPosition;
          },
          child: Obx(
            () => CustomPaint(
              painter: draw_controller.draw_Box(w),
              child: Container(
                width: w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
