import 'package:get/get.dart';
import '../services/services.dart';

translateDatabase(columnen ,columnar){
  MyServices myServices = Get.find();
  if(myServices.sharedPreferences.getString("lang")=="en"){
    return columnen ;
  }else{
    return columnar ;
  }
}