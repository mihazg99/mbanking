import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbanking/controllers/register_controller.dart';

class PageTwo extends StatelessWidget {
  PageTwo({Key? key}) : super(key: key);

  final controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: buildForm(),
    );
  }

  Widget buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'PIN',
          style: TextStyle(
            color: Color(0xff131829),
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 20),
        Obx(
          () => TextFormField(
            controller: controller.pinController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              errorText: controller.validate.value
                  ? null
                  : 'PIN mora sadržavati najmanje 4 i najvise 6 znamenki',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
