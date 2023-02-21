import 'package:dartz/dartz.dart';
import 'package:mobile_shop/data/datasource/authentication_datasource.dart';
import 'package:mobile_shop/di/di.dart';
import 'package:mobile_shop/util/api_exeption.dart';
import 'package:mobile_shop/util/auth_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm);
  Future<Either<String, String>> login(String username, String password);
}

class AuthenticationRepository extends IAuthRepository {
  final IAuthenticationDatasource _datasource = locator.get();
  //final SharedPreferences _sharedPreferences = locator.get();

  @override
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm) async {
    try {
      await _datasource.register('amirmahdi', '12345678', '12345678');
      return right('ثبت نام انجام شد !');
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'null');
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      String token = await _datasource.login(username, password);
      if (token.isNotEmpty) {
        AuthMnager.saveToken(token);
        return right('شما وارد شده اید');
      } else {
        return left('خطایی در ورود پیش آمده است');
      }
    } on ApiExeption catch (e) {
      return left('${e.message}');
    }
  }
}
