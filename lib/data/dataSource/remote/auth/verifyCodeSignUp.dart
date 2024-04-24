import '../../../../core/classes/crud.dart';
import '../../../../linkAPIs.dart';

class VerifyCodeSignUpData {
  Crud crud;

  VerifyCodeSignUpData(this.crud);

  postVerifyCodeSignUpData(String email,String verifyCode) async {
    var response = await crud.postRequest(AppLinks.verifyCodesSignupAPI, {
      "email": email,
      "verifyCode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }


  resendVerifyCodeSignUpData(String email) async {
    var response = await crud.postRequest(AppLinks.resendVerifyCode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }

}
