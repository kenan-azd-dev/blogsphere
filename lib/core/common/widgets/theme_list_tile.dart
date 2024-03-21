import 'package:flutter/material.dart';
// 3rd Party Packages
import 'package:flutter_bloc/flutter_bloc.dart';
// Project Files
import '../providers/theme_provider.dart';



class ThemeModeListTile extends StatelessWidget {
  const ThemeModeListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();
    return ListTile(
      leading: const Icon(Icons.settings_rounded),
      title: const Text('Theme mode'),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Theme mode'),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.light_mode_rounded),
                      title: const Text('Light'),
                      onTap: () => themeProvider.setThemeMode(ThemeMode.light),
                    ),
                    ListTile(
                      leading: const Icon(Icons.dark_mode_rounded),
                      title: const Text('Dark'),
                      onTap: () => themeProvider.setThemeMode(ThemeMode.dark),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings_rounded),
                      title: const Text('System'),
                      onTap: () => themeProvider.setThemeMode(ThemeMode.system),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
