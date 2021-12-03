import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbanking/controllers/home_controller.dart';
import 'package:mbanking/screens/login/login.dart';
import 'package:mbanking/screens/transactions/transactions.dart';
import '../../core/account_card.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 60, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'accounts'.tr,
                      style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Lato',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(child: const Icon(Icons.logout),onTap: ()=>Get.offAll(()=>Login(),))
                  ],
                )),
            Obx(() => Expanded(
                  child: controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : buildList(context),
                )),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Widget buildList(context) {
    return ListView.builder(
        itemCount: controller.accountList.length,
        itemBuilder: (context, index) {
          var account = controller.accountList[index];

          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: AccountCard(
              acc: account,
              call: () => Get.to(() => Transactions(acc: account)),
            ),
          );
        });
  }
}
