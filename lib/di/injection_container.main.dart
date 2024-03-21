part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initBlog();

  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPrefs);

  // * Remote Data Source Initialization * //
  await dotenv.load(fileName: '.env');
  final String apiKey = dotenv.env["API_KEY"]!;
  final String baseUrl = dotenv.env["BASE_URL"]!;
  final supabase = await Supabase.initialize(url: baseUrl, anonKey: apiKey);

  sl.registerLazySingleton(() => supabase.client);
  
  Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;

  sl.registerLazySingleton(
    () => Hive.box(name: 'blogs'),
  );

  // * Core * //
  sl.registerFactory(() => InternetConnection());

  sl.registerLazySingleton(
    () => AppUserCubit(),
  );
  sl.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImpl(
      sl(),
    ),
  );

  // * Providers * //
  sl.registerSingleton<ThemeProvider>(ThemeProvider(prefs: sl()));
}

void _initAuth() {
  // Datasource
  sl
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        sl(),
      ),
    )
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        sl(),
        sl(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserSignUpUseCase(
        sl(),
      ),
    )
    ..registerFactory(
      () => UserLoginUseCase(
        sl(),
      ),
    )
    ..registerFactory(
      () => CurrentUserUseCase(
        sl(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUpUseCase: sl(),
        userLogInUseCase: sl(),
        currentUserUseCase: sl(),
        appUserCubit: sl(),
      ),
    );
}

void _initBlog() {
  // Datasource
  sl
    ..registerFactory<BlogRemoteDataSource>(
      () => BlogRemoteDataSourceImpl(
        sl(),
      ),
    )
    ..registerFactory<BlogLocalDataSource>(
      () => BlogLocalDataSourceImpl(
        sl(),
      ),
    )
    // Repository
    ..registerFactory<BlogRepository>(
      () => BlogRepositoryImpl(
        sl(),
        sl(),
        sl(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UploadBlog(
        sl(),
      ),
    )
    ..registerFactory(
      () => GetAllBlogs(
        sl(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => BlogBloc(
        uploadBlog: sl(),
        getAllBlogs: sl(),
      ),
    );
}
