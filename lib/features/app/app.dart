import 'package:flutter/material.dart';

// 3rd Party Packages
import 'package:provider/provider.dart';

// Project Files
import '../../core/core.dart';
import '../auth/presentation/pages/sign_up/sign_up_page.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlogSphere',
      debugShowCheckedModeBanner: false,
      themeMode: context.read<ThemeProvider>().themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      onGenerateRoute: (settings) => Routing.generateRoute(settings),
      home: const SignUpPage(),
    );
  }
}
