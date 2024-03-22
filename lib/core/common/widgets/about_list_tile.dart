import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutListTile extends StatelessWidget {
  const AboutListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.question_mark_rounded),
      title: const Text('About'),
      onTap: () => showDialog(
        context: context,
        builder: (context) => const AboutDialog(
          email: 'kenanazd.dev@gmail.com',
          githubUrl: 'https://www.github.com/kenan-azd-dev',
          linkedinUrl: 'https://www.linkedin.com/in/kenan-abozaineddin/',
          name: 'Kenan Abo Zaineddin',
        ),
      ),
    );
  }
}

class AboutDialog extends StatelessWidget {
  final String name;
  final String email;
  final String githubUrl;
  final String linkedinUrl;

  const AboutDialog({
    Key? key,
    required this.name,
    required this.email,
    required this.githubUrl,
    required this.linkedinUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.info_outline),
          Gap(8.0),
          Text('About BlogSphere'),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Welcome! My name is '),
                  TextSpan(
                    text: name,
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                      text:
                          ', Let me give you some information about the app.\n\n'),
                  const TextSpan(
                    text: 'Tech Stack:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                      text:
                          '\n  * Flutter for a smooth and beautiful user experience.\n  * Supabase for a powerful and flexible backend.\n  * Bloc for predictable state management.\n  * Hive for offline data storage.\n  * FPDart for a functional programming approach.\n\n'),
                  const TextSpan(
                    text: 'Features:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                      text:
                          '\n  * Create and share blog posts\n  * Login and user accounts\n  * Dark and Light mode themes\n\n'),
                  const TextSpan(
                    text: 'Feedback:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                      text:
                          ' I\'m always looking for ways to improve the app.  If you have any feedback or suggestions, please don\'t hesitate to reach out to me at '),
                  TextSpan(
                    text: email,
                    style: const TextStyle(color: Colors.blue),
                  ),
                  const TextSpan(text: '.\n\n'),
                  const TextSpan(
                      text: 'Social Media:\n',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8.0, left: 10),
                          child: const Icon(
                            FontAwesomeIcons.github,
                            size: 15,
                          ),
                        ),
                      ),
                      const TextSpan(text: 'Github: '),
                      TextSpan(
                        text: 'kenan-azd-dev\n',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launch(githubUrl),
                      ),
                    ],
                  ),
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8.0, left: 10),
                          child: const Icon(
                            FontAwesomeIcons.linkedin,
                            size: 15,
                          ),
                        ),
                      ),
                      const TextSpan(text: 'LinkedIn: '),
                      TextSpan(
                        text: 'Kenan Abo Zaineddin',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launch(linkedinUrl),
                      ),
                    ],
                  ),
                  //const WidgetSpan(
                  //  child: SizedBox(
                  //    child: Row(
                  //      children: [
                  //        Icon(FontAwesomeIcons.github, size: 16),
                  //        Text('\n  GitHub: '),
                  //      ],
                  //    ),
                  //  ),
                  //),
                  // TextSpan(
                  //   text: name,
                  //   style: const TextStyle(color: Colors.blue),
                  //   recognizer: TapGestureRecognizer()
                  //     ..onTap = () => launchUrl(githubUrl),
                  // ),
                  // const TextSpan(text: '\n  * LinkedIn: '),
                  // TextSpan(
                  //   text: name,
                  //   style: const TextStyle(color: Colors.blue),
                  //   recognizer: TapGestureRecognizer()
                  //     ..onTap = () => launchUrl(linkedinUrl),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}

// Function to launch URL in webview
void launch(String url) async {
  if (!await launchUrl(Uri(scheme: 'https', host: url),
      mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}
