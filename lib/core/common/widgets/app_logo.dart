import 'package:flutter/cupertino.dart';

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
              return const Icon(
                CupertinoIcons.globe,
                size: 96,
              );
            } else if (_style == AppLogoStyle.horizontal) {
              return const Row(
                children: [
                  Icon(
                    CupertinoIcons.globe,
                    size: 96,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
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
              return const Column(
                children: [
                  Icon(
                    CupertinoIcons.globe,
                    size: 96,
                  ),
                  Text(
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
