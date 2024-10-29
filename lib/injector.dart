import 'package:get_it/get_it.dart';

import '/core/network/connectivity_status.dart';
import '/core/network/interceptor_barrel.dart';
import '/core/network/network_client.dart';
import '/domain/repositories/repository_barrel.dart';
import '/domain/usecases/use_case_barrel.dart';
import '/core/routes/routes.dart';
import '/core/storage/get_storage_manager.dart';
import '/core/utils/error_parser.dart';
import 'data/datasources/remote/todos/todos_remote_data_source.dart';
import 'data/datasources/remote/todos/todos_remote_data_source_impl.dart';
import 'data/repositories/todos/todos_repository_impl.dart';

final injector = GetIt.instance;

Future<void> registerDependencies() async {

  injector
    // Routes
    ..registerLazySingleton<AppRoutes>(() => AppRoutes())

    // Local Storage
    ..registerLazySingleton<GetStorageManager>(() => GetStorageManager())

    // Network Interceptors
    ..registerLazySingleton<AcceptTypeInterceptor>(() => AcceptTypeInterceptor())
    ..registerLazySingleton<ContentTypeInterceptor>(() => ContentTypeInterceptor())
    ..registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor())
    ..registerLazySingleton<ResponseInterceptor>(() => ResponseInterceptor())
    ..registerLazySingleton<AuthorizationInterceptor>(() => AuthorizationInterceptor(injector()))

    // Network
    ..registerLazySingleton<NetworkInfo>(() => ConnectivityStatus())
    ..registerLazySingleton<ErrorParser>(() => ApiResponseError())

    // Data Sources
    ..registerLazySingleton<TodosRemoteDataSource>(() => TodosRemoteDataSourceImpl(NetworkClient(injector(), [injector<AcceptTypeInterceptor>(), injector<LoggerInterceptor>()])))

    // Repositories
    ..registerLazySingleton<TodosRepository>(() => TodosRepositoryImpl(injector()))

    // Use Cases
    ..registerLazySingleton<TodosUseCase>(() => TodosUseCase(injector()));
}