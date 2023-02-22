import 'package:get/get.dart';
import 'package:get_demo/api/user_api.dart';
import 'package:get_demo/model/users_model.dart';

/// A class where we write business logic and place all variable,methods and
/// controller inside it.
class UsersController extends GetxController {
  // variable to check the api is loading or not
  var isLoading = false.obs;
  // An empty list to add the list of user details
  // Here we will continuously observe the changes in the list by using .obs
  var usersList = <UsersModel>[].obs;

  // Initializing the value to count variable
  // and observing it continuously
  var count = 0.obs;

  @override
  void onInit() {
    // calling the fetch user function as the controller gets initialized
    fetchUser();
    super.onInit();
  }

  // Function to call user api and assign the data to user list
  fetchUser() async {
    try {
      isLoading(true);
      var users = await UsersApi().getUsers();
      usersList.assignAll(users);
    } finally {
      isLoading(false);
    }
  }

// Function to increment the value of count by 1
  incrementCount() {
    count++;
  }

// Function to decrement the value of count by 1
  decrementCount() {
    count--;
  }
}
