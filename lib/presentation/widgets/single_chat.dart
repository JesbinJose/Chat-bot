import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SingleChatWidget extends StatelessWidget {
  const SingleChatWidget({
    super.key,
    required this.content,
  });

  final Content content;

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.sizeOf(context);
    return Center(
      child: Container(
        color: content.role == 'model' ? Colors.blue.shade800 : Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(content.role == 'model' ? 'Gemini' : 'User'),
              Markdown(
                padding: EdgeInsets.zero,
                onTapLink: (text, href, title)async {
                  print(await launchUrlString(href!));
                },
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                data:
                    content.parts?.lastOrNull?.text ?? 'cannot generate data!',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
