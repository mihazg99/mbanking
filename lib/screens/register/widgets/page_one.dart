import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbanking/controllers/register_controller.dart';

class PageOne extends StatelessWidget {
  PageOne({Key? key}) : super(key: key);

  final controller = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: buildForm(),);
  }

  Widget buildForm() {
    return Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'firstname'.tr,
              style: const TextStyle(
                color: Color(0xff131829),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: controller.firstnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: 'Unesite ime',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Molimo unesite ime';
                }
                if (value.length >30) {
                  return 'Maksimalno 30 znakova';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'lastname'.tr,
              style: const TextStyle(
                color: Color(0xff131829),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: controller.lastnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                hintText: 'Unesite prezime',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Molimo unesite prezime';
                }
                if (value.length >30) {
                  return 'Maksimalno 30 znakova';
                }
                return null;
              },
            ),
          ],
        ));
  }
}
