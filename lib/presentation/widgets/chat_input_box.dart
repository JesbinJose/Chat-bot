import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatInputBox extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onSend;

  const ChatInputBox({
    super.key,
    this.controller,
    this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                controller: controller,
                minLines: 1,
                maxLines: 6,
                cursorColor: Theme.of(context).colorScheme.inversePrimary,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: '  Message',
                  border: InputBorder.none,
                ),
                onTapOutside: (_) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: FloatingActionButton.small(
              onPressed: onSend,
              child: const Icon(
                Icons.send_rounded,
              ),
            ),
          )
        ],
      ),
    );
  }
}
