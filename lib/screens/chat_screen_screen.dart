import 'package:firebase_project/models/doctor_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final Doctor doctor;

  const ChatScreen({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Dr ${doctor.name}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              // Here you would typically load messages
              children: [
                // Example chat messages
                ListTile(
                  title: Text('Hello, how can I help you?'),
                  subtitle: Text('Dr ${doctor.name}'),
                ),
                ListTile(
                  title: Text('I have a question about my appointment.'),
                  subtitle: Text('You'),
                ),
                // Add more messages here
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.mic),
                  onPressed: () {
                    // Logic to send the message
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Color.fromARGB(255, 55, 124, 180),
                  ),
                  onPressed: () {
                    // Logic to send the message
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
