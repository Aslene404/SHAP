import 'dart:convert';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:linkedin_login/linkedin_login.dart';
import '../../../../core/error/exception.dart';

abstract class LoginRemoteDataSource {
  Future<Map<String, dynamic>?> login(
      Map<String, dynamic> user); //login using SH Account
  Future<Map<String, dynamic>?> login_facebook(); //login using Facebook Account
  Future<Map<String, dynamic>?> login_linked_in(
      Map<String, dynamic> user); //login using Linked In Account
  Future<Map<String, dynamic>?> login_xing(); //login using Xing Account
  Future<Map<String, dynamic>?> login_google(); //login using google Account

}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client client;

  LoginRemoteDataSourceImpl({required this.client});

  Future<Map<String, dynamic>?> login(Map<String, dynamic> user) async {
    Map<String, String> headers = {
      "Content-Type": "application/json"
    }; //setting content type as json

    final response = await http.post(
        Uri.parse("https://sofort-handelsregister.com:3000/api/Customers/login"),
        headers: headers,
        body: json.encode(user)); //Api response given the user info required

    if (response.statusCode == 200) {
      // if response is OK
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw ServerExeption(
          message:
              json.decode(response.body)["detail"]); //message of the error
    }
  }

  @override
  Future<Map<String, dynamic>?> login_google() async {
    final _googleSignIn = GoogleSignIn();
    final userData = await _googleSignIn.signIn();
    String? first_name;
    String? last_name;
    print(userData!.displayName);
    List<String> wordList = userData.displayName!.split(" ");
    if (wordList.length <= 2) {
      first_name = wordList[0];
      last_name = wordList[1];
    } else {
      first_name = wordList[0];
      last_name = wordList[1] + " " + wordList[2];
    }
    String email = userData.email;

    Map<String, dynamic> user = {
      "is_from_social_media": true,
      "first_name": "$first_name",
      "last_name": "$last_name",
      "email": "$email",
      "source": "google"
    };
    print(user);
    Map<String, String> headers = {
      "Content-Type": "application/json"
    }; //setting content type as json

    final response = await http.post(
        Uri.parse("https://sofort-handelsregister.com:3000/api/Customers/login"),
        headers: headers,
        body: json.encode(user)); //Api response given the user info required

    if (response.statusCode == 200) {
      // if response is OK
      print(json.decode(response.body));
      _googleSignIn.disconnect();
      return json.decode(response.body);
    } else {
      _googleSignIn.disconnect();
      throw ServerExeption(
          message:
              json.decode(response.body)["detail"]); //message of the error
    }
  }

  @override
  Future<Map<String, dynamic>?> login_facebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      //if login is successful
      AccessToken? _accessToken = result.accessToken;
      JsonEncoder encoder =
          const JsonEncoder.withIndent('  '); //convert result into Map
      String pretty = encoder.convert(_accessToken!.toJson());
      print(pretty);

      final userData = await FacebookAuth.instance.getUserData();
      String? first_name;
      String? last_name;
      print(userData["name"]);
      List<String> wordList = userData["name"].split(" ");
      if (wordList.length <= 2) {
        first_name = wordList[0];
        last_name = wordList[1];
      } else {
        first_name = wordList[0];
        last_name = wordList[1] + " " + wordList[2];
      }
      String email = userData["email"];
      String pretty_userdata = encoder.convert(userData);
      print(pretty_userdata);
      Map<String, dynamic> user = {
        "is_from_social_media": true,
        "first_name": "$first_name",
        "last_name": "$last_name",
        "email": "$email",
        "source": "facebook"
      };
      print(user);
      Map<String, String> headers = {
        "Content-Type": "application/json"
      }; //setting content type as json

      final response = await http.post(
          Uri.parse("https://sofort-handelsregister.com:3000/api/Customers/login"),
          headers: headers,
          body: json.encode(user)); //Api response given the user info required

      if (response.statusCode == 200) {
        // if response is OK
        print(json.decode(response.body));
         FacebookAuth.instance.logOut();
        _accessToken = null;

        return json.decode(response.body);
      } else {
        await FacebookAuth.instance.logOut();
        _accessToken = null;
        throw ServerExeption(
            message:
                json.decode(response.body)["detail"]); //message of the error
      }
    } else {
      print(result.status);

      throw ServerExeption(message: result.message.toString());
    }
  }

  @override
  Future<Map<String, dynamic>?> login_linked_in(
      Map<String, dynamic> user) async {
    Map<String, String> headers = {
      "Content-Type": "application/json"
    }; //setting content type as json

    final response = await http.post(
        Uri.parse("https://sofort-handelsregister.com:3000/api/Customers/login"),
        headers: headers,
        body: json.encode(user)); //Api response given the user info required

    if (response.statusCode == 200) {
      // if response is OK
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw ServerExeption(
          message:
              json.decode(response.body)["detail"]); //message of the error
    }
  }

  @override
  Future<Map<String, dynamic>?> login_xing() async {
    Map<String, dynamic>? map;
    return map;
  }
}
