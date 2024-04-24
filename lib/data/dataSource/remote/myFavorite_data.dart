import 'package:kiwi/linkAPIs.dart';
import '../../../core/classes/crud.dart';

class MyFavoriteData {
  Crud crud;

  MyFavoriteData(this.crud);

  getMyFavoriteData(String userId ) async {
    var response = await crud.postRequest(AppLinks.favoriteView, {
      "userid" : userId.toString() ,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteMyFavoriteData(int idOfFavoriteItem ) async {
    var response = await crud.postRequest(AppLinks.favoriteDelete, {
      "id" : idOfFavoriteItem.toString() ,
    });
    return response.fold((l) => l, (r) => r);
  }
}
