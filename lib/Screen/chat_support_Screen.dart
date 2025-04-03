import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/base_scaffold_widget.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:intl/intl.dart';

// Chat Message Model
class ChatMessage {
  final String message;
  final bool isMe;
  final DateTime time;
  final String? imageUrl;

  ChatMessage({
    required this.message,
    required this.isMe,
    required this.time,
    this.imageUrl,
  });
}

class ChatSupportScreen extends StatefulWidget {
  @override
  _ChatSupportScreenState createState() => _ChatSupportScreenState();
}

class _ChatSupportScreenState extends State<ChatSupportScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<ChatMessage> _messages = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadInitialMessages();
  }

  void _loadInitialMessages() async {
    setState(() => _isLoading = true);

    // Simulate loading from API
    await Future.delayed(1.seconds);

    setState(() {
      _messages = [
        ChatMessage(
          message: "Hello! How can I help you today?",
          isMe: false,
          time: DateTime.now().subtract(Duration(minutes: 5)),
          // ChatMessage(
          //   time: "",
          // ),
        )
      ];
      _isLoading = false;
    });

    _scrollToBottom();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final newMessage = ChatMessage(
      message: _messageController.text,
      isMe: true,
      time: DateTime.now(),
    );

    setState(() {
      _messages.add(newMessage);
      _messageController.clear();
    });

    _scrollToBottom();
    _simulateReply();
  }

  void _simulateReply() async {
    await Future.delayed(2.seconds);

    setState(() {
      _messages.add(ChatMessage(
        message: "Thanks for your message! Our team will respond shortly.",
        isMe: false,
        time: DateTime.now(),
      ));
    });

    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: 300.milliseconds,
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment:
        message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: context.width() * 0.75,
            ),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: message.isMe
                  ? primaryColor.withOpacity(0.1)
                  : context.cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: message.isMe
                    ? primaryColor.withOpacity(0.3)
                    : Colors.grey.withOpacity(0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (message.imageUrl != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(message.imageUrl!),
                  ),
                if (message.imageUrl != null) 6.height,
                Text(message.message, style: primaryTextStyle()),
              ],
            ),
          ),
          4.height,
          Text(
            DateFormat('hh:mm a').format(message.time),
            style: secondaryTextStyle(size: 10),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "Support Chat",
      appnavcolor: primaryColor,

      child: Column(
        children: [
          // Chat Header


          // Chat Messages
          Expanded(
            child: _isLoading
                ? LoaderWidget()
                : ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(_messages[index]);
              },
            ),
          ),

          // Message Input
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: context.cardColor,
              boxShadow: [
                BoxShadow(color: Colors.black12, blurRadius: 2),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.add, color: primaryColor),
                  onPressed: _showAttachmentOptions,
                ),
                5.width,
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: context.scaffoldBackgroundColor,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    maxLines: 3,
                    minLines: 1,
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                5.width,
                IconButton(
                  icon: Icon(Icons.send, color: primaryColor),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.image, color: primaryColor),
              title: Text("Gallery"),
              onTap: () {
                // finish(context);
                toast("Gallery option selected");
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt, color: primaryColor),
              title: Text("Camera"),
              onTap: () {
                // finish(context);
                toast("Camera option selected");
              },
            ),
            ListTile(
              leading: Icon(Icons.insert_drive_file, color: primaryColor),
              title: Text("Documents"),
              onTap: () {
                // finish(context);
                toast("Documents option selected");
              },
            ),
          ],
        ),
      ),
    );
  }


}