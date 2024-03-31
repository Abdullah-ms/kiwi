import '../../../../../core/classes/crud.dart';
import '../../../../../linkAPIs.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;

  VerifyCodeForgetPasswordData(this.crud);

  postVerifyCodeForgetPasswordData(String email , String verifyCode ) async {
    var response = await crud.postRequest(AppLinks.verifyCodeAPI, {
      "email": email,
      "verifyCode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
