import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/presentation/bloc/auth_bloc/auth_bloc.dart';

class LogOutListTile extends StatelessWidget {
  const LogOutListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout_rounded),
      title: const Text('Log out'),
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Log out'),
            content: const Text('You are about to log out. Are you sure?'),
            actions: [
              ElevatedButton(
                onPressed: () =>
                    context.read<AuthBloc>().add(UserLoggedOutEvent()),
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('No'),
              )
            ],
          );
        },
      ),
    );
  }
}
