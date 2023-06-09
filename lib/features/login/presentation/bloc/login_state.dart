import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shap/features/login/domain/entities/user.dart';
import 'package:shap/features/login/domain/usecases/login.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends LoginState {}

class Loading extends LoginState {}

class Loaded extends LoginState {
  final  user;

  Loaded({required this.user});

  @override
  List<Object> get props => [user];
}

class Error extends LoginState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}