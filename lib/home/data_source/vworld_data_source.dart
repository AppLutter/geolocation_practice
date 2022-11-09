import 'dart:convert';
import 'dart:developer';

import 'package:geolocation_practice/const.dart';
import 'package:geolocation_practice/models/coordinate_to_address_model/coordinate_to_address_model.dart';
import 'package:geolocation_practice/sealed_class/result/result.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

const String vWorldBaseUrl = "http://api.vworld.kr/req/address";

class VWorldDataSource {
  http.Client _client;

  VWorldDataSource({http.Client? client}) : _client = (client ?? http.Client());

  Future<Result<CoordinateToAddressModel>> getAddress(Position position) async {
    try {
      Uri uri = Uri.parse(
          "$vWorldBaseUrl?service=address&request=getAddress&key=$vWorldKey&point=${position.longitude},${position.latitude}&type=BOTH");
      log(uri.toString());
      final response = await _client.get(uri);
      print(jsonDecode(utf8.decode(response.bodyBytes))['response']['result'][0]);
      if (response.statusCode == 200) {
        return Result.success(CoordinateToAddressModel.fromJson(
            jsonDecode(utf8.decode(response.bodyBytes))['response']['result'][0]));
      } else {
        throw (Exception());
      }
    } catch (e) {
      return Result.error("주소 요청을 불러오는데 실패하였습니다.");
    }
  }
}
