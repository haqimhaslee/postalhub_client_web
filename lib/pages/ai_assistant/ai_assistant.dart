// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AskOurAi extends StatefulWidget {
  const AskOurAi({super.key});
  @override
  State<AskOurAi> createState() => _AskOurAiState();
}

class _AskOurAiState extends State<AskOurAi> {
  late final GenerativeModel _model;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode(debugLabel: 'TextField');
  bool _loading = false;
  final List<Message> _messages = [];
  final ChatSession _chatSession = ChatSession(); // Maintain chat history

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-1.5-flash-8b',
      apiKey: 'AIzaSyCcUGyhB6jq9jGI9n0hHtUuBfjBeu7e5_U',
    );
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ParcelMate (Preview)"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.surface,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _messages.length,
                itemBuilder: (context, idx) {
                  return MessageWidget(
                    text: _messages[idx].text,
                    isFromUser: _messages[idx].isFromUser,
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 25),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    focusNode: _textFieldFocus,
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Prompt here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: _loading
                          ? Padding(
                              padding: const EdgeInsets.all(10),
                              child: LoadingAnimationWidget.flickr(
                                leftDotColor:
                                    Theme.of(context).colorScheme.tertiary,
                                rightDotColor:
                                    Theme.of(context).colorScheme.secondary,
                                size: 20,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(5),
                              child: IconButton(
                                icon: const Icon(Icons.send),
                                onPressed: () =>
                                    _sendChatMessage(_textController.text),
                              ),
                            ),
                    ),
                    onSubmitted: _sendChatMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendChatMessage(String message) async {
    if (message.trim().isEmpty) return;
    setState(() {
      _loading = true;
      _messages.add(Message(text: message, isFromUser: true));
    });
    _textController.clear();
    _scrollDown();

    var responseText = '';
    setState(() {
      _messages.add(Message(text: responseText, isFromUser: false));
    });

    try {
      _chatSession.addUserMessage(message); // Add user message to session
      final stream = _model.generateContentStream(_chatSession.history);
      await for (final event in stream) {
        final part = event.text;
        if (part != null) {
          setState(() {
            responseText += part;
            _messages.last = Message(text: responseText, isFromUser: false);
          });
          _scrollDown();
        }
      }
      _chatSession.addBotMessage(responseText); // Store bot response
    } catch (e) {
      _showError(e.toString());
    } finally {
      setState(() => _loading = false);
      _textFieldFocus.requestFocus();
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

class ChatSession {
  final List<Content> history = [];

  void addUserMessage(String message) {
    history.add(Content.text(message));
  }

  void addBotMessage(String response) {
    history.add(Content.text(response));
  }
}

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isFromUser;

  const MessageWidget(
      {super.key, required this.text, required this.isFromUser});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isFromUser)
          const CircleAvatar(
              backgroundImage: AssetImage('assets/images/postalhub_logo.jpg'),
              radius: 13),
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
            decoration: BoxDecoration(
              color: isFromUser
                  ? Theme.of(context).colorScheme.primaryContainer
                  : null,
              borderRadius: BorderRadius.circular(13),
            ),
            child: MarkdownBody(
              selectable: true,
              data: text,
              onTapLink: (text, href, title) {
                if (href != null) launchUrl(Uri.parse(href));
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Message {
  final String text;
  final bool isFromUser;

  Message({required this.text, required this.isFromUser});
}
