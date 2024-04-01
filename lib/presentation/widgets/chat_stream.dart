import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_gemini/presentation/widgets/chat_input_box.dart';
import 'package:test_gemini/presentation/widgets/single_chat.dart';
import 'package:test_gemini/state/chats.dart';

class StreamChatWidget extends StatelessWidget {
  const StreamChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StreamChatProvider>(
      builder: (context, provider, child) => Column(
        children: [
          Expanded(
            child: provider.chats.isNotEmpty
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      reverse: true,
                      child: ListView.builder(
                        itemBuilder: (_, index) => SingleChatWidget(
                          content: provider.chats[index],
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: provider.chats.length,
                      ),
                    ),
                  )
                : const Center(
                    child: Text('Let\'s chat something!'),
                  ),
          ),
          if (provider.loading) const CircularProgressIndicator(),
          ChatInputBox(
            controller: provider.controller,
            onSend: () => provider.addChatMessage(provider.controller.text),
          ),
        ],
      ),
    );
  }
}
