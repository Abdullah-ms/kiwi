import '../../../../../core/classes/crud.dart';
import '../../../../../linkAPIs.dart';

class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);

  postCheckEmailData(String email) async {
    var response = await crud.postRequest(AppLinks.checkEmailAPI, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
