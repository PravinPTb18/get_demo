import 'package:get_demo/model/users_model.dart';
import 'package:http/http.dart';
import '../constants/app_constants.dart';

/// A user api call which will handle all the api request for user details
class UsersApi {
  // An api call to get user details which will returns the
  // list of user data
  Future<List<UsersModel>> getUsers() async {
    Response response = await get(Uri.parse(AppConstants.userApiUrl));
    if (response.statusCode == 200) {
      // parsing the response to user model
      return usersModelFromJson(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
