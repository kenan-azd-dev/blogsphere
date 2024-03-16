part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPrefs);

  sl.registerSingleton<ThemeProvider>(ThemeProvider(prefs: sl()));
}
