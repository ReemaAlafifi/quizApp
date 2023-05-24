import 'package:flutter/material.dart';
import 'package:quiz_app/screens/create_quiz_screen.dart';
import 'package:quiz_app/screens/start_quiz_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Your Name'),
            accountEmail: Text('Your email'),
            decoration: BoxDecoration(color: Colors.teal),
            currentAccountPicture: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.pink,
              child: Text(
                'S',
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CreateQuizScreen(),
                ),
              );
            },
            leading: const Icon(Icons.edit),
            title: const Text('Create Quiz'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StartQuizScreen(),
                ),
              );
            },
            leading: const Icon(Icons.quiz),
            title: const Text('Start Quiz'),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit'),
          ),
        ],
      ),
    );
  }
}
