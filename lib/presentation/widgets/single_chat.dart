import 'dart:ui';

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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: BackdropFilter(
            blendMode: BlendMode.src,
            filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
            child: Container(
              color: content.role == 'model' ? const Color.fromARGB(20, 33, 149, 243) : const Color.fromARGB(19, 224, 48, 224),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content.role == 'model' ? 'Gemini' : 'You',
                  ),
                  Markdown(
                    syntaxHighlighter: CodeSnippetStyle(),
                    padding: EdgeInsets.zero,
                    onTapLink: (text, href, title) async {
                      await launchUrlString(href!);
                    },
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    data: content.parts?.lastOrNull?.text ?? 'cannot generate data!',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CodeSnippetStyle implements SyntaxHighlighter {
  @override
  TextSpan format(String source) {
    return TextSpan(
      style: const TextStyle(fontStyle: FontStyle.italic),
      text: source,
    );
  }
}
