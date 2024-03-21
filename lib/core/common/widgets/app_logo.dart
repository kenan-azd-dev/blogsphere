import 'package:flutter/material.dart';

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
      height: _size!,
      width: _size,
      child: Builder(
        builder: (context) {
          if (_style == AppLogoStyle.textOnly) {
            return const FittedBox(
              child: Text(
                'BlogSphere',
                style: TextStyle(
                  fontFamily: 'Mirador',
                  fontWeight: FontWeight.w700,
                  fontSize: 48,
                ),
              ),
            );
          } else if (_style == AppLogoStyle.markOnly) {
            return CircleAvatar(
              radius: _size,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(logoPath),
            );
          } else if (_style == AppLogoStyle.horizontal) {
            return FittedBox(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: _size / 3,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(logoPath),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    'BlogSphere',
                    style: TextStyle(
                      fontFamily: 'Mirador',
                      fontWeight: FontWeight.w700,
                      fontSize: _size / 2,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(logoPath),
                  backgroundColor: Colors.transparent,
                  radius: _size / 4,
                ),
                Text(
                  'BlogSphere',
                  style: TextStyle(
                    fontFamily: 'Mirador',
                    fontWeight: FontWeight.w700,
                    fontSize: _size / 5,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
