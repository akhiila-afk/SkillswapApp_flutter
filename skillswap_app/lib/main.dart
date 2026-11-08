
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
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const SkillsPage(),
    );
  }
}

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  final List<Map<String, String>> skills = [
    {'name': 'Flutter Development', 'category': 'Programming'},
    {'name': 'Java Programming', 'category': 'Programming'},
    {'name': 'Python Programming', 'category': 'Programming'},
    {'name': 'UI/UX Design', 'category': 'Design'},
    {'name': 'Graphic Design', 'category': 'Design'},
    {'name': 'Communication Skills', 'category': 'Soft Skills'},
  ];

  String searchText = '';
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final filteredSkills = skills.where((skill) {
      final matchesSearch = skill['name']!
          .toLowerCase()
          .contains(searchText.toLowerCase());

      final matchesCategory = selectedCategory == 'All' ||
          skill['category'] == selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('SkillSwap - Explore Skills'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Search skills',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Select Category',
                border: OutlineInputBorder(),
              ),
              items: [
                'All',
                'Programming',
                'Design',
                'Soft Skills',
              ].map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
            const SizedBox(height: 15),

            Text(
              'Available Skills (${filteredSkills.length})',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: filteredSkills.isEmpty
                  ? const Center(child: Text('No skills found'))
                  : ListView.builder(
                      itemCount: filteredSkills.length,
                      itemBuilder: (context, index) {
                        final skill = filteredSkills[index];

                        return Card(
                          child: ListTile(
                            leading: const Icon(
                              Icons.school,
                              color: Colors.deepPurple,
                            ),
                            title: Text(skill['name']!),
                            subtitle: Text(skill['category']!),
                            trailing: const Icon(Icons.arrow_forward_ios),
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

