import 'package:crypto_demo/features/auth/cubit/biometric_cubit.dart';
import 'package:crypto_demo/features/auth/data/datasources/biometric_local_datasource.dart';
import 'package:crypto_demo/features/auth/data/repositories/biometric_repository_impl.dart';
import 'package:crypto_demo/features/auth/domain/repositories/biometric_repository.dart';
import 'package:crypto_demo/features/auth/domain/usecases/authenticate_with_biometrics_usecase.dart';
import 'package:crypto_demo/features/auth/domain/usecases/check_biometrics_availability_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:crypto_demo/core/services/firebase_auth_service.dart';
import 'package:crypto_demo/core/services/firestore_service.dart';
import 'package:crypto_demo/core/theme/cubit/app_theme_cubit.dart';

import 'package:crypto_demo/features/coin_details/cubit/coin_details_cubit.dart';
import 'package:crypto_demo/features/coin_details/data/repos/coin_details_repo_impl.dart';
import 'package:crypto_demo/features/coin_details/domain/repositories/coin_details_repo.dart';
import 'package:crypto_demo/features/coin_details/domain/usecases/get_coin_details_usecase.dart';
import 'package:crypto_demo/features/coin_details/domain/usecases/get_market_chart_usecase.dart';
import 'package:crypto_demo/features/home/cubit/home_cubit.dart';
import 'package:crypto_demo/features/home/data/repo/home_repo_impl.dart';
import 'package:crypto_demo/features/home/domain/repositories/home_repo.dart';
import 'package:crypto_demo/features/home/domain/usecases/get_market_overview_usecase.dart';
import 'package:crypto_demo/features/home/domain/usecases/get_top_gainers_usecase.dart';
import 'package:crypto_demo/features/home/domain/usecases/get_trending_coins_usecase.dart';
import 'package:crypto_demo/features/market/cubit/market_coin_cubit.dart';
import 'package:crypto_demo/features/market/data/repo/market_coin_repo_impl.dart';
import 'package:crypto_demo/features/market/domain/repositories/market_coin_repo.dart';
import 'package:crypto_demo/features/market/domain/usecases/get_market_coins_usecase.dart';
import 'package:crypto_demo/features/market/domain/usecases/search_coins_usecase.dart';
import 'package:crypto_demo/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:crypto_demo/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:crypto_demo/features/auth/domain/repositories/auth_repository.dart';
import 'package:crypto_demo/features/auth/domain/usecases/login_usecase.dart';
import 'package:crypto_demo/features/auth/domain/usecases/register_usecase.dart';
import 'package:crypto_demo/features/auth/domain/usecases/logout_usecase.dart';
import 'package:crypto_demo/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:crypto_demo/features/auth/cubit/auth_cubit.dart';

import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  // Dio & ApiService
  Dio dio = DioFactory.instance();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Theme
  getIt.registerLazySingleton<AppThemeCubit>(() => AppThemeCubit());

  // Firebase Services
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService());

  // Auth Feature
  getIt.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      authService: getIt<FirebaseAuthService>(),
      firestoreService: getIt<FirestoreService>(),
    ),
  );
  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(dataSource: getIt<AuthRemoteDataSource>()),
  );

  getIt.registerFactory<LoginUseCase>(
    () => LoginUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerFactory<RegisterUseCase>(
    () => RegisterUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerFactory<LogoutUseCase>(
    () => LogoutUseCase(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerFactory<CheckAuthStatusUseCase>(
    () => CheckAuthStatusUseCase(authRepository: getIt<AuthRepository>()),
  );

  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      getIt<LoginUseCase>(),
      getIt<RegisterUseCase>(),
      getIt<CheckAuthStatusUseCase>(),
      getIt<LogoutUseCase>(),
    ),
  );

  getIt.registerFactory<HomeRepo>(
    () => HomeRepoImpl(apiService: getIt<ApiService>()),
  );

  getIt.registerFactory<GetMarketOverview>(
    () => GetMarketOverview(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerFactory<GetTrendingCoins>(
    () => GetTrendingCoins(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerFactory<GetTopGainers>(
    () => GetTopGainers(homeRepo: getIt<HomeRepo>()),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      getMarketStatUsecase: getIt<GetMarketOverview>(),
      getTrendingCoinsUsecase: getIt<GetTrendingCoins>(),
      getTopGainersUsecase: getIt<GetTopGainers>(),
    ),
  );

  getIt.registerFactory<MarketCoinRepo>(
    () => MarketCoinRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerFactory<GetMarketCoinsUsecase>(
    () => GetMarketCoinsUsecase(marketCoinRepo: getIt<MarketCoinRepo>()),
  );
  getIt.registerFactory<SearchCoinsUsecase>(
    () => SearchCoinsUsecase(marketCoinRepo: getIt<MarketCoinRepo>()),
  );
  getIt.registerFactory<MarketCoinCubit>(
    () => MarketCoinCubit(
      getMarketCoinsUsecase: getIt<GetMarketCoinsUsecase>(),
      searchCoinsUsecase: getIt<SearchCoinsUsecase>(),
    ),
  );

  getIt.registerFactory<CoinDetailsRepo>(
    () => CoinDetailsRepoImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerFactory<GetCoinDetailsUsecase>(
    () => GetCoinDetailsUsecase(coinDetailsRepo: getIt<CoinDetailsRepo>()),
  );

  getIt.registerFactory<GetMarketChartUsecase>(
    () => GetMarketChartUsecase(coinDetailsRepo: getIt<CoinDetailsRepo>()),
  );

  getIt.registerFactoryParam<CoinDetailsCubit, String, void>(
    (coinId, _) => CoinDetailsCubit(
      coinId: coinId,
      getCoinDetailsUsecase: getIt<GetCoinDetailsUsecase>(),
      getMarketChartUsecase: getIt<GetMarketChartUsecase>(),
    ),
  );

  // Data source
  getIt.registerLazySingleton(() => BiometricLocalDataSource());

  // Repository
  getIt.registerLazySingleton<BiometricRepository>(
    () => BiometricRepositoryImpl(getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => AuthenticateWithBiometricsUsecase(getIt()));

  getIt.registerLazySingleton(
    () => CheckBiometricsAvailabilityUsecase(getIt()),
  );

  // Cubit
  getIt.registerFactory(
    () => BiometricCubit(
      authenticateUseCase: getIt(),
      checkAvailabilityUseCase: getIt(),
    ),
  );
}
