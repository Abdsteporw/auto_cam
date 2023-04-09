
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Draw_Controller extends GetxController{

void validate_the_values(bool text_Forms_state){
  if(text_Forms_state){

  }else{
    Get.defaultDialog(title: 'ERROR',
        content: Text('the values you enterd have error , please check again')
    );
  }
}

}