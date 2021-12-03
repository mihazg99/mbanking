import 'package:get/get.dart';
import 'package:mbanking/models/account.dart';
import 'package:mbanking/services/services.dart';

class HomeController extends GetxController{
  var accountList = <Account>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  void fetchUser() async{
    Services.getUserData().then((user){
      if(user != null){
        accountList.value = user.acounts;
        isLoading.value = false;
      }
    });
  }

}