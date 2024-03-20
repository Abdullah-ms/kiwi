import 'dart:io';

Future checkInternet() async {
  try {
    var connect = await InternetAddress.lookup("google.com");
    if (connect.isNotEmpty && connect[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}
