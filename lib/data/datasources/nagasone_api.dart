import 'package:fluttertoast/fluttertoast.dart';
import 'package:nagasone/data/models/chip_model.dart';
import 'package:http/http.dart' as http;
import 'package:nagasone/data/models/fc_model.dart';
import 'package:nagasone/data/models/fc_stat_model.dart';
import 'dart:convert';

import 'package:nagasone/presentation/theme.dart';

class NagasoneAPI {
  static const _apiUrl = 'https://391a-81-200-8-229.ngrok.io';

  Future<ChipModel> createChipTransaction({
    required int chipCount,
    required String transactionType,
  }) async {
    const url = '$_apiUrl/transaction';

    final body = <String, dynamic>{
      'chipCount': chipCount,
      'transactionType': transactionType,
    };

    final http.Response response;
    try {
      response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );
      Fluttertoast.showToast(
          msg: "Успешно создано",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.grey,
          textColor: AppColors.white,
          fontSize: 12.0);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.grey,
          textColor: AppColors.white,
          fontSize: 12.0);
      rethrow;
    }

    if (response.statusCode == 200) {
      return ChipModel.fromJson(
        jsonDecode(response.body.replaceAll("\n", "")) as Map<String, dynamic>,
      );
    } else {
      throw Exception(response.body);
    }
  }

  Future<FCModel> createFCTransaction({
    required int amount,
    required String transactionType,
  }) async {
    const url = '$_apiUrl/transaction_fc';

    final body = <String, dynamic>{
      'amount': amount,
      'transactionType': transactionType,
    };

    final http.Response response;
    try {
      response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );
      Fluttertoast.showToast(
          msg: "Успешно создано",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.grey,
          textColor: AppColors.white,
          fontSize: 12.0);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.grey,
          textColor: AppColors.white,
          fontSize: 12.0);
      rethrow;
    }

    if (response.statusCode == 200) {
      return FCModel.fromJson(
        jsonDecode(response.body.replaceAll("\n", "")) as Map<String, dynamic>,
      );
    } else {
      throw Exception(response.body);
    }
  }

  Future<List<ChipModel>> getChipsTransactions() async {
    const url = '$_apiUrl/transaction';
    final http.Response response;
    try {
      response = await http.get(Uri.parse(url));
    } catch (e) {
      rethrow;
    }

    if (response.statusCode == 200) {
      final List? jsonResponse = jsonDecode(response.body) as List<dynamic>?;
      return jsonResponse!
          .map((fc) => ChipModel.fromJson(fc as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> deleteFCTransaction(String uuid) async {
    final url = '$_apiUrl/transaction_fc/$uuid';
    final http.Response response;
    try {
      response = await http.delete(Uri.parse(url));
    } catch (e) {
      rethrow;
    }

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Удалено",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.grey,
          textColor: AppColors.white,
          fontSize: 12.0);
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> createDump() async {
    const url = '$_apiUrl/db_dump';
    final http.Response response;
    try {
      response = await http.get(Uri.parse(url));
    } catch (e) {
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.grey,
          textColor: AppColors.white,
          fontSize: 12.0);
      rethrow;
    }

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "DB dump saved!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.grey,
          textColor: AppColors.white,
          fontSize: 12.0);
    } else {
      throw Exception(response.body);
    }
  }

  Future<List<FCModel>> getFCTransactions() async {
    const url = '$_apiUrl/transaction_fc';
    final http.Response response;
    try {
      response = await http.get(Uri.parse(url));
    } catch (e) {
      rethrow;
    }

    if (response.statusCode == 200) {
      final List? jsonResponse = jsonDecode(response.body) as List<dynamic>?;
      return jsonResponse!
          .map((fc) => FCModel.fromJson(fc as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(response.body);
    }
  }

  Future<FCStatModel> getFCStatTransactions() async {
    const url = '$_apiUrl/transaction_fc_stat';
    final http.Response response;
    try {
      response = await http.get(Uri.parse(url));
    } catch (e) {
      rethrow;
    }

    if (response.statusCode == 200) {
      return FCStatModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  Future<bool> rebuildDB() async {
    const url = '$_apiUrl/rebuild';
    final http.Response response;
    try {
      response = await http.get(Uri.parse(url));
    } catch (e) {
      rethrow;
    }

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "DB rebuilded",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.grey,
          textColor: AppColors.white,
          fontSize: 12.0);
      return true;
    } else {
      throw Exception(response.body);
    }
  }
}
