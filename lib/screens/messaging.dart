import 'package:flutter/material.dart';

import '../utils/work_categories_model.dart';
import 'show_conversation.dart';

class Messaging extends StatefulWidget {
  const Messaging({Key? key}) : super(key: key);

  @override
  _MessagingState createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: const Color(0xFF0E5C46),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: storeNames.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(storeNames[index].image!),
            ),
            title: Text(storeNames[index].name!),
            subtitle: Text('Message body of ${storeNames[index].name}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConversationScreen(
                    storeName: storeNames[index].name!,
                    storeIndex: index,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
