import 'dart:convert';


import 'package:http/http.dart' as http;
import '../../../../core/error/exception.dart';


abstract class CompanySearchRemoteDataSource {
  Future<Map<String,dynamic>?> company_search(Map<String,dynamic> company);//search for companies from API
  Future<Map<String,dynamic>?> company_detail(String company_id);//get specific company information from API
  Future<Map<String,dynamic>?> company_contact(String company_number);//get specific company information from API
  Future<Map<String,dynamic>?> company_insolvency(String company_number);//get specific company information from API
  Future<Map<String,dynamic>?> company_notices(String company_number);//get specific company information from API
  Future<Map<String,dynamic>?> company_officers(String company_number);//get specific company information from API
  Future<Map<String,dynamic>?> company_documents(String company_id);//get specific company information from API
  Future<Map<String,dynamic>?> company_sheets(String company_id);//get specific company information from API
  Future<Map<String,dynamic>?> company_stats(String company_number);//get specific company information from API
  Future<List<dynamic>?> company_branches(String company_number);//get specific company information from API



}

class CompanySearchRemoteDataSourceImpl implements CompanySearchRemoteDataSource {
  final http.Client client;

  CompanySearchRemoteDataSourceImpl({required this.client});

  Future<Map<String,dynamic>?> company_search(Map<String,dynamic> company) async {

    Map<String,String> headers={
      "Content-Type": "application/json"
    };//setting content type as json

    final response=await http.post(Uri.parse("https://sofort-handelsregister.com:3000/api/company/advanced_search"),
        headers: headers,
        body:json.encode(company));//Api response given the company info required

      if (response.statusCode == 200 ) { // if response is OK
        print(json.decode(response.body));
        return json.decode(response.body);
      } else {
        throw ServerExeption(message: json.decode(response.body)["detail"]);//message of the error
      }





    }

  @override
  Future<Map<String, dynamic>?> company_detail(String company_id) async {
    Map<String,String> headers={
      "Content-Type": "application/json"
    };//setting content type as json

    final response=await http.get(Uri.parse("https://sofort-handelsregister.com:3000/api/company/$company_id"),
        headers: headers,
        );
    if (response.statusCode == 200 ) { // if response is OK
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw ServerExeption(message: json.decode(response.body)["detail"]);//message of the error
    }
  }

  @override
  Future<Map<String, dynamic>?> company_contact(String company_number) async {
    Map<String,String> headers={
      "Content-Type": "application/json"
    };//setting content type as json

    final response=await http.get(Uri.parse("https://sofort-handelsregister.com:3000/api/company/getCompanyContact/$company_number"),
      headers: headers,
    );
    if (response.statusCode == 200 ) { // if response is OK
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw ServerExeption(message: json.decode(response.body)["detail"]);//message of the error
    }
  }

  @override
  Future<Map<String, dynamic>?> company_insolvency(String company_number) async {
    Map<String,String> headers={
      "Content-Type": "application/json"
    };//setting content type as json

    final response=await http.post(Uri.parse("https://sofort-handelsregister.com:3000/api/company/checkInsolvency/$company_number"),
      headers: headers,
    );
    if (response.statusCode == 200 ) { // if response is OK
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw ServerExeption(message: json.decode(response.body)["detail"]);//message of the error
    }
  }

  @override
  Future<Map<String, dynamic>?> company_notices(String company_number) async {
    Map<String,String> headers={
      "Content-Type": "application/json"
    };//setting content type as json

    final response=await http.get(Uri.parse("https://sofort-handelsregister.com:3000/api/notice/getByCompany/$company_number"),
      headers: headers,
    );
    if (response.statusCode == 200 ) { // if response is OK
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw ServerExeption(message: json.decode(response.body)["detail"]);//message of the error
    }
  }

  @override
  Future<Map<String, dynamic>?> company_officers(String company_number) async {
    Map<String,String> headers={
      "Content-Type": "application/json"
    };//setting content type as json

    final response=await http.get(Uri.parse("https://sofort-handelsregister.com:3000/api/officers/$company_number"),
      headers: headers,
    );
    if (response.statusCode == 200 ) { // if response is OK
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw ServerExeption(message: json.decode(response.body)["detail"]);//message of the error
    }
  }
  @override
  Future<Map<String, dynamic>?> company_documents(String company_id) async {
    Map<String,String> headers={
      "Content-Type": "application/json"
    };//setting content type as json

    final response=await http.get(Uri.parse("https://sofort-handelsregister.com:3000/api/products/getProductsFromRegiterProtal/$company_id"),
      headers: headers,
    );
    if (response.statusCode == 200 ) { // if response is OK
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw ServerExeption(message: json.decode(response.body)["detail"]);//message of the error
    }
  }
  @override
  Future<Map<String, dynamic>?> company_sheets(String company_id) async {
    Map<String,String> headers={
      "Content-Type": "application/json"
    };//setting content type as json

    final response=await http.get(Uri.parse("https://sofort-handelsregister.com:3000/api/products/getBilans/$company_id"),
      headers: headers,
    );
    if (response.statusCode == 200 ) { // if response is OK
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw ServerExeption(message: json.decode(response.body)["detail"]);//message of the error
    }
  }
  Future<Map<String, dynamic>?> company_stats(String company_number) async {
    Map<String,String> headers={
      "Content-Type": "application/json"
    };//setting content type as json

    final response=await http.post(Uri.parse("https://sofort-handelsregister.com:3000/api/company/companyBilanzAssetsStat/$company_number"),
      headers: headers,
    );
    if (response.statusCode == 200 ) { // if response is OK
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw ServerExeption(message: json.decode(response.body)["detail"]);//message of the error
    }
  }
  Future<List<dynamic>?> company_branches(String company_number) async {
    Map<String,String> headers={
      "Content-Type": "application/json"
    };//setting content type as json

    final response=await http.get(Uri.parse("https://sofort-handelsregister.com:3000/api/company/branches/$company_number"),
      headers: headers,
    );
    if (response.statusCode == 200 ) { // if response is OK
      print(json.decode(response.body));
      return json.decode(response.body);
    } else {
      throw ServerExeption(message: json.decode(response.body)["detail"]);//message of the error
    }
  }


  }
