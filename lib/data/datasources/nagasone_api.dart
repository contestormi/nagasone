import 'package:nagasone/data/models/chip_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NagasoneAPI {
  static const _apiUrl = 'https://0bc9-81-200-8-57.ngrok.io';

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
    } catch (e) {
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
}
