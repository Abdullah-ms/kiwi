import 'package:kiwi/linkAPIs.dart';
import '../../../core/classes/crud.dart';

class ItemsData {
  Crud crud;

  ItemsData(this.crud);

  getItemsData(int id) async {
    var response = await crud.postRequest(AppLinks.items, {
      // من الضروري تحويله الى string لان نوع الركوست بالبك ايند هو string
      "id" : id.toString() ,
    });
    return response.fold((l) => l, (r) => r);
  }
}
