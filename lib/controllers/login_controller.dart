import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mbanking/screens/home/home.dart';

class LoginController extends GetxController{

  TextEditingController pinController = TextEditingController();
  var validate = true.obs;

  void checkPin(){
   if(pinController.text.length < 4){
     validate.value = false;
   }else{
     validate.value = true;
     Get.offAll(()=>Home());
   }
  }

}