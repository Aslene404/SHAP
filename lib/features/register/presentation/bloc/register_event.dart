import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterProcess extends RegisterEvent {
  final String salutation;
  final String title;
  String type="Basic";
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  final String phone_number;
  final String company;
  final String ustid;
  final String street;
  final String house_number;
  final String zip_code;
  final String city;
  final String agb;

  RegisterProcess(this.salutation, this.title, this.first_name, this.last_name, this.email, this.password, this.phone_number, this.company, this.ustid, this.street, this.house_number, this.zip_code, this.city, this.agb
      );

  @override
  List<Object> get props => [email,password, salutation, title,type, first_name, last_name, phone_number, company, ustid, street, house_number, zip_code, city, agb];
}
