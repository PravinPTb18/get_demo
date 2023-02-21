import 'package:get/get.dart';
import 'package:get_demo/api/user_api.dart';
import 'package:get_demo/model/users_model.dart';

class UsersController extends GetxController {
  var isLoading = false.obs;
  var usersList = <UsersModel>[].obs;
  var count = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchUser();
    super.onInit();
  }

  fetchUser() async {
    try {
      isLoading(true);
      var users = await UsersApi().getUsers();
      usersList.assignAll(users);
    } finally {
      isLoading(false);
    }
  }

  incrementCount() {
    count++;
  }

  decrementCount() {
    count--;
  }
}
