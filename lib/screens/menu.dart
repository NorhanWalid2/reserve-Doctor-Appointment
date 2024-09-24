import 'package:firebase_project/screens/login_screenn.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/download (1).jpg')
                  // If you want to use a network image, use Image.network()
                  // backgroundImage: NetworkImage('https://example.com/profile.jpg'),
                  ),
              SizedBox(height: 10),
              Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        const ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('User Account Management'),
        ),
        const ListTile(
          leading: Icon(Icons.support),
          title: Text('Support & Assistance'),
        ),
        const ListTile(
          leading: Icon(Icons.info),
          title: Text('App Information'),
        ),
        const ListTile(
          leading: Icon(Icons.local_offer),
          title: Text('Promotions & Offers'),
        ),
        const ListTile(
          leading: Icon(Icons.connect_without_contact),
          title: Text('Social Media and Community'),
        ),
        const ListTile(
          leading: Icon(Icons.emoji_events),
          title: Text('Loyalty Program'),
        ),
        const ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Log OUt'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
        ),
      ],
    );
  }
}
