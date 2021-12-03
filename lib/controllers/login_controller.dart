import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mbanking/controllers/register_controller.dart';
import 'package:mbanking/screens/home/home.dart';

class LoginController extends GetxController{

  final controllerReg = Get.find<RegisterController>();
  TextEditingController pinController = TextEditingController();
  var validate = true.obs;

  void checkPin(){
   if(pinController.text == controllerReg.pin){
     validate.value = true;
     Get.offAll(()=>Home());
   }else{
     validate.value = false;
   }
  }

}