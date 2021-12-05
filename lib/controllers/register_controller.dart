import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mbanking/screens/home/home.dart';

class RegisterController extends GetxController {
  var formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

  TextEditingController pinController = TextEditingController();
  var validate = true.obs;

  String? firstname, lastname, pin;
  var validCharacters = RegExp(r'^[a-žA-Ž0-9 ]+$');

  PageController pageController = PageController(initialPage: 0);
  var index = 0.obs;

  void checkPin() {
    if (pinController.text.length < 4) {
      validate.value = false;
    } else {
      validate.value = true;
      pin = pinController.text;
      Get.to(() => Home());
    }
  }

  void procced() {
    if (index.value == 0 && formKey.currentState!.validate()) {
      firstname = firstnameController.text;
      lastname = lastnameController.text;
      index.value++;
      pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    } else if (index.value == 1) {
      checkPin();
    }
  }
}
