import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:kiwi/core/classes/statusRequest.dart';
import 'package:kiwi/core/functions/checkInternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postRequest(
      String urlLink, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(urlLink), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offline);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }
}
