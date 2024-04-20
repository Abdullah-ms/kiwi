import 'package:kiwi/linkAPIs.dart';
import '../../../core/classes/crud.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  addFavoriteData(String userId , String itemId ) async {
    var response = await crud.postRequest(AppLinks.favoriteAdd, {
      "usersid" : userId ,
      "itemsid" : itemId ,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavoriteData(String userId , String itemId ) async {
    var response = await crud.postRequest(AppLinks.favoriteRemove, {
      "usersid" : userId ,
      "itemsid" : itemId ,
    });
    return response.fold((l) => l, (r) => r);
  }

}
