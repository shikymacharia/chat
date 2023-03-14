import 'package:flutter/material.dart';

import 'screens/chat.dart';
import 'screens/chatlist.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'screens/setting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/chatList': (context) => ChatListScreen(),
        '/settings': (context) => SettingsScreen(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name!.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'chat') {
          final int chatId = int.parse(pathElements[2]);
          return MaterialPageRoute(
            builder: (context) => ChatScreen(chatId: chatId),
          );
        }
        return null;
      },
    );
  }
}
