
import 'package:build_flavor/data/datasource/remote/auth_api_service.dart';
import 'package:build_flavor/data/dto/authentication_dto.dart';
import 'package:build_flavor/data/dto/profile_dto.dart';

class AuthRepository {
  AuthApiService authApiService = AuthApiService();

  Future<AuthenticationDto> login(String userName, String passWord) {
    return authApiService.login(userName, passWord);
  }

  Future logout() {
    return authApiService.logout();
  }

  Future<ProfileDto> profile() {
    return authApiService.profile();
  }
}
