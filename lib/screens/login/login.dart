import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mbanking/controllers/login_controller.dart';
import 'package:mbanking/controllers/register_controller.dart';
import 'package:mbanking/core/dialog_button.dart';
import 'package:mbanking/core/primary_button.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final controller = Get.put(LoginController());
  final controllerReg = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
                title: 'login'.tr,
                onPressed: () {
                  showPinDialog(context);
                })
          ],
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Text(
                'Login',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Lato',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            Text(
              'hi'.tr,
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Lato',
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              controllerReg.firstname! + ' ' + controllerReg.lastname!,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Lato',
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  showPinDialog(context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              actions: [
                Center(
                    child: DialogButton(
                  onPressed: () => controller.checkPin(),
                ))
              ],
              content: Container(
                height: 100,
                child: Column(
                  children: [
                    const Text("Unesite PIN"),
                    Obx(() => TextField(
                        decoration: InputDecoration(
                            errorText: controller.validate.value
                                ? null
                                : 'Netočan PIN'),
                        controller: controller.pinController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        maxLength: 6))
                  ],
                ),
              ),
            ));
  }
}
