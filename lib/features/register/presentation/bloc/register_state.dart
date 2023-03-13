

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RegisterState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends RegisterState {}

class Loading extends RegisterState {}

class Loaded extends RegisterState {
  final  user;

  Loaded({required this.user});

  @override
  List<Object> get props => [user];
}

class Error extends RegisterState {
  final String message;

  Error({required this.message});

  @override
  List<Object> get props => [message];
}