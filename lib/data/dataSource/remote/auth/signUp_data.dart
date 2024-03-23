import '../../../../core/classes/crud.dart';
import '../../../../linkAPIs.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  getSignUpData(
      String username, String email, String phone, String password) async {
    var response = await crud.postRequest(AppLinks.signUpAPI, {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
