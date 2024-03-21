import 'package:flutter/material.dart';
class AboutListTile extends StatelessWidget {
  const AboutListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.question_mark_rounded),
      title: const Text('About'),
      onTap: () {},
    );
  }
}
