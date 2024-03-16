import 'package:flutter/material.dart';

// 3rd Party Packages
import 'package:provider/provider.dart';

// Project Files
import '../../core/core.dart';
import './app.dart';
import '../../injection_container.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<ThemeProvider>(create: (context) => sl()),
      ],
      child: const BlogApp(),
    );
  }
}