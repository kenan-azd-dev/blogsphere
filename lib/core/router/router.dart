import 'package:flutter/material.dart';

// Project Files
import '../../features/auth/presentation/pages/login_page/login_page.dart';
import '../../features/auth/presentation/pages/sign_up/sign_up_page.dart';
import '../../features/blog/presentation/pages/blog_page/blog_page.dart';

part 'routes.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case logIn:
        return MaterialPageRoute(builder: (_) => const LogInPage());
      case blogPage:
        return MaterialPageRoute(builder: (_) => const BlogPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
