
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
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        cardTheme: CardThemeData(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// Reusable Skill Card
class SkillCard extends StatelessWidget {
  final String skill;
  final IconData icon;

  const SkillCard({
    super.key,
    required this.skill,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple),
        title: Text(skill),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}

// Reusable Student Card
class StudentCard extends StatelessWidget {
  final String name;
  final String course;

  const StudentCard({
    super.key,
    required this.name,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(name),
        subtitle: Text(course),
      ),
    );
  }
}

// Reusable App Button
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

// Reusable Profile Header
class ProfileHeader extends StatelessWidget {
  final String name;

  const ProfileHeader({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.person, size: 45, color: Colors.white),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text('SkillSwap Student'),
      ],
    );
  }
}

// Home Screen
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SkillSwap'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: ProfileHeader(name: 'Student Name'),
            ),
            const SizedBox(height: 25),

            const Text(
              'Student Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const StudentCard(
              name: 'Rahul',
              course: 'Flutter Developer',
            ),
            const StudentCard(
              name: 'Priya',
              course: 'UI/UX Designer',
            ),

            const SizedBox(height: 20),
            const Text(
              'Popular Skills',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SkillCard(
              skill: 'Flutter Development',
              icon: Icons.phone_android,
            ),
            const SkillCard(
              skill: 'Java Programming',
              icon: Icons.code,
            ),
            const SkillCard(
              skill: 'UI/UX Design',
              icon: Icons.design_services,
            ),
            const SkillCard(
              skill: 'Python Programming',
              icon: Icons.computer,
            ),

            const SizedBox(height: 20),
            Center(
              child: AppButton(
                text: 'Explore Skills',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Explore Skills clicked!')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

