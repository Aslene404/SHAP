
import 'package:shap/features/login/domain/entities/user.dart';

class UserModel extends User {
  UserModel({salutation,
   title,
     type="Basic",
   required first_name,
  required last_name,
   phone_number,
  required email,
   password,
   street,
   house_number,
     zip_code,
     city,
     company,
     ustid,
     agb,}
  ) : super(salutation: salutation,
  title: title,
    type: type,
  first_name: first_name,
  last_name: last_name,
  phone_number: phone_number,
  email: email,
  password: password,
  street: street,
  house_number: house_number,
  zip_code: zip_code,
  city: city,
  company: company,
  ustid: ustid,
  agb: agb,);
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(

      first_name: json['first_name'],
      last_name: json['last_name'],
      email: json['email'],
      password: json['password'],
      salutation: json['salutation'],
      title: json['title'],
      phone_number: json['phone_number'],
      street: json['street'],
      house_number: json['house_number'],
      zip_code: json['zip_code'],
      company: json['company'],
      agb: json['agb'],
      type: json['type'],
      city: json['city'],
      ustid: json['ustid'],
    );
  }
  Map<String, dynamic> toJson() {
    return {

      '"first_name"': '"$first_name"',
      '"last_name"': '"$last_name"',
      '"email"': '"$email"',
      '"password"':'"$password"' ,
      '"salutation"': '"$salutation"',
      '"title"':'"$title"' ,
      '"phone_number"': '"$phone_number"',
      '"street"': '"$street"',
      '"house_number"':'"$house_number"' ,
      '"zip_code"':'"$zip_code"' ,
      '"company"':'"$company"' ,
      '"agb"': '"$agb"',
      '"type"': '"$type"',
      '"city"': '"$city"',
      '"ustid"': '"$ustid"',
    };
  }
}