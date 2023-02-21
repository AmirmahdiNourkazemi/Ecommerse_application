import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:mobile_shop/bloc/authentication/auth_state.dart';
import 'package:mobile_shop/bloc/authentication/auth_event.dart';
import 'package:mobile_shop/data/repository/authentication_repository.dart';
import 'package:mobile_shop/di/di.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository = locator.get();
  AuthBloc() : super(AuthInitiateState()) {
    on<AuthLoginRequest>(
      (event, emit) async {
        emit(AuthLoginState());
        await _repository.login(event.username, event.password);
      },
    );
  }
}
