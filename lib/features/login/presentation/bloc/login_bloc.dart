import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shap/core/error/failures.dart';
import 'package:shap/core/usecases/usecase.dart';
import 'package:shap/features/login/domain/entities/user.dart';
import 'package:shap/features/login/domain/usecases/login.dart' as l;
import 'package:shap/features/login/domain/usecases/login_facebook.dart';
import 'package:shap/features/login/domain/usecases/login_xing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/usecases/login.dart';
import '../../domain/usecases/login_google.dart';
import '../../domain/usecases/login_linked_in.dart' as lli;
import '../../domain/usecases/login_linked_in.dart';
import 'login_event.dart';
import 'login_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input.';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login login;
  final LoginGoogle login_google;
  final LoginFacebook login_facebook;
  final LoginLinkedIn login_linked_in;
  final LoginXing login_xing;

  LoginBloc({
    required Login concrete,required LoginGoogle google,required LoginFacebook facebook,required LoginLinkedIn linkedIn,required LoginXing xing})  : assert(concrete != null),
        assert(google != null),assert(facebook != null),assert(linkedIn != null),assert(xing != null),
        login = concrete,login_google=google,login_facebook=facebook,login_linked_in=linkedIn,login_xing=xing, super(Empty());

  @override
  LoginState get initialState => Empty();

  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
    if (event is LoginProcess) {
      final inputEmail = event.email;
      final inputPassword = event.password;
      String value='{"email" : "$inputEmail", "password":"$inputPassword"}';
      print(value);
      Map<String,dynamic> valueMap = jsonDecode(value) ;
      print(valueMap);





      yield Loading();
          final failureOrSuccess =
          await login(l.Params(user: valueMap));



          yield* _eitherLoadedOrErrorState(failureOrSuccess);

            };
    if (event is LoginGoogleProcess) {
      yield Loading();
      final failureOrSuccess =
      await login_google(NoParams()) ;



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is LoginFacebookProcess) {
      yield Loading();
      final failureOrSuccess =
      await login_facebook(NoParams()) ;



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is LoginLinkedInProcess) {
      yield Loading();

      // SharedPreferences prefs;
      // prefs = await SharedPreferences.getInstance();
      // String? x =prefs.getString("CACHED_USER");
      //final failureOrSuccess = await Map<String, dynamic>.from(jsonDecode(x!)) ;
      final inputEmail = event.email;
      final inputFirstName = event.first_name;
      final inputLastName = event.last_name;
      Map<String,dynamic> user={
        "is_from_social_media": true,
        "first_name":"$inputFirstName",
        "last_name":"$inputLastName",
        "email": "$inputEmail",
        "source":"linkedIn"
      };


      print(user);
      final failureOrSuccess = await login_linked_in(lli.Params(user:user ));



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };
    if (event is LoginXingProcess) {
      yield Loading();

      // SharedPreferences prefs;
      // prefs = await SharedPreferences.getInstance();
      // String? x =prefs.getString("CACHED_USER");
      //final failureOrSuccess = await Map<String, dynamic>.from(jsonDecode(x!)) ;
      final failureOrSuccess = await login_xing(NoParams()) ;



      yield* _eitherLoadedOrErrorState(failureOrSuccess);

    };

    }
  }

  Stream<LoginState> _eitherLoadedOrErrorState(
      Either<Failure, Map<String, dynamic>?> failureOrSuccess,
      ) async* {
    yield failureOrSuccess.fold(
          (failure) => Error(message: _mapFailureToMessage(failure)),
          (valueMap) => Loaded(user:valueMap),
    );
  }

Stream<LoginState> _eitherLoadedOrErrorState_google(
    Either<Failure, GoogleSignInAccount?> failureOrSuccess,
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
