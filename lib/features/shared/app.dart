import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 3rd Party Packages

// Project Files
import '../../core/core.dart';
import '../auth/presentation/pages/sign_up/sign_up_page.dart';
import '../blog/presentation/pages/blog_page/blog_page.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlogSphere',
      debugShowCheckedModeBanner: false,
      themeMode: context.watch<ThemeProvider>().themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      onGenerateRoute: (settings) => Routing.generateRoute(settings),
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return const BlogPage();
          }
          return const SignUpPage();
        },
      ),
    );
  }
}
