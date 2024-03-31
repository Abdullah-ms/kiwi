import 'package:get/get.dart';

validInput(String val, int max, int min, String? type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "Invalid username";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Invalid email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Invalid phone number";
    }
  }

  if (val.isEmpty) {
    return "Can't be empty";
  }

  if (val.length > max) {
    return "Can't be larger than $max";
  }

  if (val.length < min) {
    return "Can't be less than $min";
  }
}
