import 'package:kiwi/linkAPIs.dart';
import '../../../core/classes/crud.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addCartData(String userId , String itemId ) async {
    var response = await crud.postRequest(AppLinks.cartAdd, {
      "usersid" : userId ,
      "itemsid" : itemId ,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCartData(String userId , String itemId ) async {
    var response = await crud.postRequest(AppLinks.cartDelete, {
      "usersid" : userId ,
      "itemsid" : itemId ,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCountCartData(String userId , String itemId ) async {
    var response = await crud.postRequest(AppLinks.cartGetCount, {
      "usersid" : userId ,
      "itemsid" : itemId ,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCartData(String userId ) async {
    var response = await crud.postRequest(AppLinks.cartView, {
      "usersid" : userId ,
    });
    return response.fold((l) => l, (r) => r);
  }


}
