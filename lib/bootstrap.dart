import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

// 3rd Party Packages
import 'package:bloc/bloc.dart';

// Project Files
import './injection_container.dart';
import './features/app/app_wrapper.dart';
import './features/app/app_bloc_observer.dart';

void bootstrap() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await initDependencies();

      runApp(const AppWrapper());
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}


