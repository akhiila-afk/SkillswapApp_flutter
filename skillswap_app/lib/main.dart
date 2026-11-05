
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SkillProvider(),
      child: const SkillSwapApp(),
    ),
  );
}

class SkillProvider extends ChangeNotifier {
  List<String> skills = [
    'Flutter Development',
    'Java Programming',
    'UI/UX Design',
    'Python Programming',
  ];

  void addSkill(String skill) {
    if (skill.trim().isNotEmpty) {
      skills.add(skill.trim());
      notifyListeners();
    }
  }

  void removeSkill(int index) {
    skills.removeAt(index);
    notifyListeners();
  }
}

class SkillSwapApp extends StatelessWidget {
  const SkillSwapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SkillSwap',
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final skillProvider = Provider.of<SkillProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SkillSwap - Manage Skills'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter a skill',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                skillProvider.addSkill(value);
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'Available Skills',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: skillProvider.skills.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.school),
                      title: Text(skillProvider.skills[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          skillProvider.removeSkill(index);
                        },
                      ),
                    ),
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
