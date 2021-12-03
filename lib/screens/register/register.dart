import 'package:flutter/material.dart';
import 'package:mbanking/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:mbanking/core/primary_button.dart';
import 'package:mbanking/screens/register/widgets/page_one.dart';
import 'package:mbanking/screens/register/widgets/page_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Text(
              'register'.tr,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Lato',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [PageOne(), PageTwo()],
          )),
          Obx(() => Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: controller.index.value,
                    count: 2,
                    effect:
                        const JumpingDotEffect(activeDotColor: Colors.black),
                  ),
                ),
              )),
          PrimaryButton(title: 'next'.tr, onPressed: () => controller.procced())
        ],
      ),
    );
  }
}
