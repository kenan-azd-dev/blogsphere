import 'package:flutter/material.dart';

// 3rd Party Packages

// Project Files
import './login_view.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    //print(sl.get<String>(instanceName: 'baseUrl'));
    return const LogInView();
  }
}