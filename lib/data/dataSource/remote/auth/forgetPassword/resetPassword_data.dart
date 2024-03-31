import '../../../../../core/classes/crud.dart';
import '../../../../../linkAPIs.dart';

class ResetPasswordData {
  Crud crud;

  ResetPasswordData(this.crud);

  postResetPasswordData(String email , String password) async {
    var response = await crud.postRequest(AppLinks.resetPasswordAPI, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
