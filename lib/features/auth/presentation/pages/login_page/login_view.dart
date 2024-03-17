import 'package:flutter/material.dart';

// 3rd Party Packages
import 'package:gap/gap.dart';

// Project Files
import '../../../../../core/core.dart';
import '../../widgets/wide_button.dart';
import '../../widgets/auth_field.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Log in',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Gap(32),
                    AuthField(
                      hintText: 'Email',
                      controller: _emailController,
                    ),
                    const Gap(16.0),
                    AuthField(
                      hintText: 'Password',
                      controller: _passwordController,
                      isObscureText: true,
                    ),
                    const Gap(16.0),
                    WideButton(
                      buttonText: 'Continue',
                      onPressed: () {},
                    ),
                    const Gap(16.0),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, signUp),
                      child: RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account yet? ',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.grey),
                          children: [
                            TextSpan(
                              text: 'Sign up',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppColors.primaryOrange,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
