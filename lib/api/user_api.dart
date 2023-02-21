import 'package:get_demo/model/users_model.dart';
import 'package:http/http.dart';
import '../constants/app_constants.dart';

class UsersApi {
  Future<List<UsersModel>> getUsers() async {
    Response response = await get(Uri.parse(AppConstants.userApiUrl));
    if (response.statusCode == 200) {
      return usersModelFromJson(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
