import 'package:blogsphere/features/auth/presentation/widgets/wide_button.dart';
import 'package:flutter/material.dart';

// 3rd Party Packages
import 'package:gap/gap.dart';

// Project Files
import '../../widgets/auth_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
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
                      'Sign up',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const Gap(32),
                    AuthField(
                      hintText: 'Name',
                      controller: _nameController,
                    ),
                    const Gap(16.0),
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
                    const Gap(32.0),
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
