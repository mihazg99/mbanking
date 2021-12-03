import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mbanking/screens/home/home.dart';

class RegisterController extends GetxController {
  var formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  var validate = true.obs;

  PageController pageController = PageController(initialPage: 0);
  var index = 0.obs;

  void checkPin(){
    if(pinController.text.length < 4){
      validate.value = false;
    }else{
      validate.value = true;
      Get.offAll(()=>Home());
    }
  }

  void procced(){
    var firstname;
    var lastname;

    if(index.value == 0 && formKey.currentState!.validate()){
      firstname = firstnameController.text;
      lastname = lastnameController.text;

      index.value++;
      pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    }else if(index.value == 1){
      checkPin();
    }
  }

}
