import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginProcess extends LoginEvent {
  final String email;
  final String password;

  LoginProcess(this.email,this.password);

  @override
  List<Object> get props => [email,password];
}
class LoginGoogleProcess extends LoginEvent{}
class LoginFacebookProcess extends LoginEvent{}
class LoginLinkedInProcess extends LoginEvent{
  final String first_name;
  final String last_name;
  final String email;
  LoginLinkedInProcess(this.first_name,this.last_name,this.email);
  @override
  List<Object> get props => [first_name,last_name,email];
}
class LoginXingProcess extends LoginEvent{}
