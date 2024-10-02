import 'package:auth_nav/auth_nav.dart';
import 'package:build_flavor/data/repositories/notification_repository.dart';
import 'package:build_flavor/domain/repository/notification/notification_repository_impl.dart';
import 'package:build_flavor/ui/blocs/auth/auth_bloc.dart';
import 'package:build_flavor/ui/blocs/notification/notification_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:oauth2_dio/oauth2_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/local/local_service.dart';
import 'data/dto/dto.dart';
import 'data/repositories/repositories.dart';
import 'env.dart';

Future initializeDependencies() async {
  Dio dio = Dio(BaseOptions(baseUrl: Env.instance.baseURL));
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  GetIt.instance.registerSingleton(dio);

  GetIt.instance.registerSingleton(AuthRepository());

  GetIt.instance.registerSingleton<NotificationRepository>(NotificationRepositoryImpl());

  //region Local Service
  GetIt.instance.registerSingleton(await SharedPreferences.getInstance());

  GetIt.instance.registerSingleton(LocalService());
  //endregion

  //region OAuth Manager
  Oauth2Manager<AuthenticationDto> oauth2manager = Oauth2Manager<AuthenticationDto>(
      currentValue: GetIt.instance.get<LocalService>().getAuthenticationDto(),
      onSave: (value) {
        GetIt.instance.get<LocalService>().saveAuth(value as AuthenticationDto);
      });

  GetIt.instance.registerSingleton<Oauth2Manager<AuthenticationDto>>(oauth2manager);

  dio.interceptors.add(
    Oauth2Interceptor(
      dio: GetIt.instance.get<Dio>(),
      oauth2Dio: Dio(BaseOptions(baseUrl: dio.options.baseUrl)),
      pathRefreshToken: 'auth/refresh-token',
      parserJson: (json) {
        return AuthenticationDto.fromJson(json as Map<String, dynamic>);
      },
      tokenProvider: oauth2manager,
    ),
  );
  //endregion

  GetIt.instance.registerSingleton(AuthNavigationBloc());

  GetIt.instance.registerSingleton(AuthBloc());

  GetIt.instance.registerSingleton(NotificationBloc());
}
