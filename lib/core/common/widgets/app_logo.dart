import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

enum AppLogoStyle {
  markOnly,
  textOnly,
  horizontal,
  stacked,
}

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    AppLogoStyle style = AppLogoStyle.horizontal,
    double? size,
  })  : _style = style,
        _size = size;

  final AppLogoStyle _style;
  final double? _size;

  @override
  Widget build(BuildContext context) {
    String logoPath;
    if (Theme.of(context).brightness == Brightness.dark) {
      logoPath = 'assets/images/logo-dark.png';
    } else {
      logoPath = 'assets/images/logo-light.png';
    }
    return SizedBox(
      height: _size! - 100,
      width: _size,
      child: FittedBox(
        child: Builder(
          builder: (context) {
            if (_style == AppLogoStyle.textOnly) {
              return const Text(
                'BlogSphere',
                style: TextStyle(
                  fontFamily: 'Mirador',
                  fontWeight: FontWeight.w700,
                  fontSize: 48,
                ),
              );
            } else if (_style == AppLogoStyle.markOnly) {
              return CircleAvatar(
                radius: _size - 120,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(logoPath),
              );
            } else if (_style == AppLogoStyle.horizontal) {
              return Row(
                children: [
                  CircleAvatar(
                    radius: _size - 120,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(logoPath),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  const Text(
                    'BlogSphere',
                    style: TextStyle(
                      fontFamily: 'Mirador',
                      fontWeight: FontWeight.w700,
                      fontSize: 48,
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(logoPath),
                    backgroundColor: Colors.transparent,
                    radius: _size - 120,
                  ),
                  const Text(
                    'BlogSphere',
                    style: TextStyle(
                      fontFamily: 'Mirador',
                      fontWeight: FontWeight.w700,
                      fontSize: 48,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
