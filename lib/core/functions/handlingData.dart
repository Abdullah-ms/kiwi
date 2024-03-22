import 'package:kiwi/core/classes/statusRequest.dart';

handlingData(response) {
  if (response is StatusRequest) {
    return response ;
  } else {
    return StatusRequest.success;
  }
}
