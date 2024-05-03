import 'package:kiwi/linkAPIs.dart';
import '../../../core/classes/crud.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getHomeData() async {
    var response = await crud.postRequest(AppLinks.homepage, {});
    return response.fold((l) => l, (r) => r);
  }

  getSearchData(String search) async {
    var response = await crud.postRequest(AppLinks.searchItems, {
      "search" : search ,
    });
    return response.fold((l) => l, (r) => r);
  }

}
