import 'package:flutter/material.dart';

// 3rd Party Packages
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project Files
import '../../core/core.dart';
import '../auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import '../blog/presentation/bloc/blog_bloc.dart';
import './app.dart';
import '../../di/injection_container.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppUserCubit>(create: (context) => sl<AppUserCubit>()),
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>()..add(IsUserLoggedInEvent()),
        ),
        BlocProvider<BlogBloc>(
          create: (context) => sl<BlogBloc>(),
        )
      ],
      child: MultiProvider(
        providers: [
          ListenableProvider<ThemeProvider>(create: (context) => sl()),
        ],
        child: const BlogApp(),
      ),
    );
  }
}
