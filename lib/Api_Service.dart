import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas1_11pplg1_14/models/login_model.dart';

class Apiservice {
  final String BaseUrl = "https://mediadwi.com/api";

  Future<ResponseModel> login(LoginModel userModel) async {
    try {
      final response = await http.post(
        Uri.parse('$BaseUrl/latihan/login'),
        body: userModel.toJson(),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return ResponseModel.fromJson(responseData);
      } else {
        return ResponseModel(
            status: false,
            message: "Gagal Menyimpan Data. Status: ${response.statusCode}",
            token: "");
      }
    } catch (e) {
      print("Exception caught: $e");
      return ResponseModel(
        status: false,
        message: "Tidak Bisa Muncul: $e",
        token: '',
      );
    }
  }

  Future<ResponseModel> Register(RegisterModel Register) async {
    try {
      final response = await http.post(
        Uri.parse('$BaseUrl/latihan/register-user'),
        body: Register.toJson(),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return ResponseModel.fromJson(responseData);
      } else {
        return ResponseModel(
          status: false,
          message: "Gagal Menyimpan Data. Status: ${response.statusCode}",
          token: '',
        );
      }
    } catch (e) {
      print("Exception caught: $e");
      return ResponseModel(
        status: false,
        message: "Tidak Bisa Muncul: $e",
        token: '',
      );
    }
  }
}
