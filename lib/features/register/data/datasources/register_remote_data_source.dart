import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../core/error/exception.dart';


abstract class RegisterRemoteDataSource {
  Future<Map<String,dynamic>?>  register(Map<String,dynamic> user);


}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final http.Client client;

  RegisterRemoteDataSourceImpl({required this.client});

  Future<Map<String,dynamic>?> register(Map<String,dynamic> user) async {

    Map<String,String> headers={
      "Content-Type": "application/json"
    };

    final response=await http.post(Uri.parse("https://sofort-handelsregister.com:3000/api/Customers/create"),
        headers: headers,
        body:json.encode(user));

    if (response.statusCode == 200 ) {
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw ServerExeption(message: json.decode(response.body)["detail"]);
    }





    }

  }
