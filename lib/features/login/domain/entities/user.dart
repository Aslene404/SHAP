import 'package:equatable/equatable.dart';


class User extends Equatable {
  final String? salutation;
  final String? title;
   String? type="Basic";
  final String first_name;
  final String last_name;
  final String? phone_number;
  final String email;
  final String? password;
  final String? street;
  final String? house_number;
  final String? zip_code;
  final String? city;
  final String? company;
  final String? ustid;
  final String? agb;


  User(
      {this.salutation,
       this.title,
        this.type,
      required this.first_name,
      required this.last_name,
       this.phone_number,
      required this.email,
        this.password,
       this.street,
       this.house_number,
       this.zip_code,
       this.city,
       this.company,
       this.ustid,
        this.agb});

  @override
  List<Object?> get props => [salutation,title,type,first_name,last_name,phone_number,email,password,street,house_number,zip_code,city,company,ustid,agb];
}