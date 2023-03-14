import 'package:flutter/material.dart';
import 'package:wewek/screens/chat.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  List<Chat> _chats = [
    Chat(id: 1, name: 'John', message: '', time: '10:00 AM'),
    Chat(id: 2, name: 'Jane', message: '', time: '11:00 AM'),
    Chat(id: 3, name: 'Bob', message: '', time: '12:00 PM'),
  ];

  void _onChatTapped(Chat chat) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(chatId: chat.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat List'),
      ),
      body: ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (context, index) {
          final chat = _chats[index];
          return ListTile(
            title: Text(chat.name),
            subtitle: Text(chat.message),
            trailing: Text(chat.time),
            onTap: () => _onChatTapped(chat),
          );
        },
      ),
    );
  }
}

class Chat {
  final int id;
  final String name;
  final String message;
  final String time;

  Chat(
      {required this.id,
      required this.name,
      required this.message,
      required this.time});
}
