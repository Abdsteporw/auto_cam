import 'package:auto_cam/Controller/Draw_Controllers/Draw_Controller.dart';
import 'package:auto_cam/Controller/File_managing_Coltrollers/Excel_Controller.dart';
import 'package:auto_cam/Controller/File_managing_Coltrollers/Files_Management_Controller.dart';
import 'package:auto_cam/Controller/File_managing_Coltrollers/PDF_Controller.dart';
import 'package:auto_cam/Controller/Manufacturing_Controllers/Lamello_Controllers.dart';
import 'package:auto_cam/Controller/Manufacturing_Controllers/Manufacturing_Controller.dart';
import 'package:auto_cam/Controller/Manufacturing_Controllers/Material_Controller.dart';
import 'package:auto_cam/Controller/Repositories_Controllers/Box_Repository.dart';
import 'package:get/get.dart';

class MY_Binding extends Bindings{

  @override
  void dependencies() {

   Get.lazyPut(()=> Box_Repository());
   Get.lazyPut(()=> Material_Controller());
   Get.lazyPut(()=> Manufacturing_Controller());
   Get.lazyPut(()=> Lamello_Controller());
   Get.lazyPut(()=> PDF_Controller());
   Get.lazyPut(()=> File_Management_Controller());
   Get.lazyPut(()=> Excel_Controller());
   Get.lazyPut(()=> Draw_Controller());

  }

}