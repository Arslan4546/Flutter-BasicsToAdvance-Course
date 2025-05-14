import 'package:second_project_api_practice/API_Service/api_service.dart';
import 'package:second_project_api_practice/API_Service/model_class.dart';

class UserAPI extends ApiService {
  // an overridden variable
  @override
  String get apiURL => "/users";

  // fetch User APi Function

  Future<List<UserAPIModel>> fetchUserAPI() async {
    List jsonList = await fetchAPI();
    return jsonList.map((map) => UserAPIModel.fromMap(map)).toList();
  }

  // fetch User APi Function By ID

  Future<UserAPIModel> fetchUserAPIById(String endPoint) async {
    var data = await fetchAPI(endPoint: endPoint);
    return UserAPIModel.fromMap(data);
  }

  // insert user Data API Fucntion
  Future<bool> insertUserAPI(UserAPIModel userAPIModel) async {
    return insertAPI(userAPIModel.toMap());
  }

  // update user Data API Fucntion
  Future<bool> updateUserAPI(UserAPIModel userAPIModel) async {
    return updateAPI("/${userAPIModel.id}", userAPIModel.toMap());
  }

  // delete user Data API Fucntion
  Future<bool> deleteUserAPI(UserAPIModel userAPIModel) async {
    return deleteAPI("/${userAPIModel.id}", userAPIModel.toMap());
  }
}
