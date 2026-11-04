
import 'package:flutter/material.dart';

void main() {
  runApp(const SkillSwapApp());
}

class SkillSwapApp extends StatelessWidget {
  const SkillSwapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkillSwap',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SkillSwap'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to SkillSwap!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Learn new skills and share what you know.'),
            const SizedBox(height: 30),

            const Text(
              'Explore SkillSwap',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              icon: const Icon(Icons.search),
              label: const Text('Explore Skills'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExplorePage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              icon: const Icon(Icons.person),
              label: const Text('My Profile'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Skills'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.code),
            title: Text('Java Programming'),
          ),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text('Flutter Development'),
          ),
          ListTile(
            leading: Icon(Icons.design_services),
            title: Text('UI/UX Design'),
          ),
          ListTile(
            leading: Icon(Icons.terminal),
            title: Text('Python Programming'),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 45,
              child: Icon(Icons.person, size: 50),
            ),
            SizedBox(height: 15),
            Text(
              'Student Name',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text('Flutter Developer'),
          ],
        ),
      ),
    );
  }
}
