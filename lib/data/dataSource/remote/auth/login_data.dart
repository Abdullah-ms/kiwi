import '../../../../core/classes/crud.dart';
import '../../../../linkAPIs.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  getLoginData(String email, String password) async {
    var response = await crud.postRequest(AppLinks.loginAPI, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
