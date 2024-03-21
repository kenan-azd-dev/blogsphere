import 'package:flutter/material.dart';

// Project Files
import '../../features/auth/presentation/pages/login_page/login_page.dart';
import '../../features/auth/presentation/pages/sign_up/sign_up_page.dart';
import '../../features/blog/domain/entities/blog.dart';
import '../../features/blog/presentation/pages/add_new_blog_page/add_new_blog_page.dart';
import '../../features/blog/presentation/pages/blog_page/blog_page.dart';
import '../../features/blog/presentation/pages/blog_viewer_page/blog_viewer_page.dart';
import '../common/widgets/error_page.dart';

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
      case addNewBlogPage:
        return MaterialPageRoute(builder: (_) => const AddNewBlogPage());
      case blogViewer:
        return MaterialPageRoute(builder: (_) {
          if (settings.arguments is Blog) {
            return BlogViewerPage(blog: settings.arguments as Blog);
          } else {
            return const ErrorPage();
          }
        });

      default:
        return MaterialPageRoute(
          builder: (_) => ErrorPage(
            message: 'No route defined for ${settings.name}',
          ),
        );
    }
  }
}
