

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shap/core/error/failures.dart';
import 'package:shap/features/register/presentation/bloc/bloc.dart';

import '../../domain/usecases/register.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input.';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final Register register;

  RegisterBloc({
    required Register concrete,})  : assert(concrete != null),
        register = concrete, super(Empty());

  @override
  RegisterState get initialState => Empty();

  @override
  Stream<RegisterState> mapEventToState(
      RegisterEvent event,
      ) async* {
    if (event is RegisterProcess) {
      final inputSalutation = event.salutation;
      final inputTitle = event.title;
      final inputFirstName = event.first_name;
      final inputLastName = event.last_name;
      final inputEmail = event.email;
      final inputPassword = event.password;
      final inputPhoneNumber = event.phone_number;
      final inputCompany = event.company;
      final inputUstid = event.ustid;
      final inputStreet = event.street;
      final inputHouseNumber = event.house_number;
      final inputZipCode = event.zip_code;
      final inputCity = event.city;
      final inputAgb = event.agb;
      String value='{"salutation" : "$inputSalutation","title" : "$inputTitle","type" : "Basic","first_name" : "$inputFirstName","last_name" : "$inputLastName","email" : "$inputEmail","password":"$inputPassword","phone_number":"$inputPhoneNumber","company":"$inputCompany","ustid":"$inputUstid","street":"$inputStreet","house_number":"$inputHouseNumber","zip_code":"$inputZipCode","city":"$inputCity","agb":"$inputAgb"}';
      print(value);
      Map<String,dynamic> valueMap = jsonDecode(value) ;
      print(valueMap);





      yield Loading();
          final failureOrSuccess =
          await register(Params(user: valueMap));



          yield* _eitherLoadedOrErrorState(failureOrSuccess);

            };

    }
  }

  Stream<RegisterState> _eitherLoadedOrErrorState(
      Either<Failure, Map<String, dynamic>?> failureOrSuccess,
      ) async* {
    yield failureOrSuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (valueMap) => Loaded(user:valueMap),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.toString().substring(14,failure.toString().length-1);
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
