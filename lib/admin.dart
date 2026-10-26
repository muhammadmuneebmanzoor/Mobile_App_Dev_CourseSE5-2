import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    final managementList = [
      {'label': 'Manage Students', 'count': '150 Active', 'icon': Icons.groups},
      {'label': 'Manage Faculty', 'count': '20 Instructors', 'icon': Icons.assignment_ind},
      {'label': 'Manage Courses', 'count': '12 Available', 'icon': Icons.book},
      {'label': 'System Settings', 'count': 'Configuration', 'icon': Icons.settings},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Administrator Panel'),
        backgroundColor: const Color(0xFF0F766E),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.teal.shade100),
                    ),
                    child: const Column(
                      children: [
                        Text('Total Users', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        SizedBox(height: 6),
                        Text('170', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F766E))),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.teal.shade100),
                    ),
                    child: const Column(
                      children: [
                        Text('Status', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        SizedBox(height: 6),
                        Text('Online', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Admin Dashboard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: managementList.length,
                itemBuilder: (context, index) {
                  final m = managementList[index];
                  return Card(
                    color: Colors.white,
                    elevation: 0,
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    child: ListTile(
                      leading: Icon(m['icon'] as IconData, color: const Color(0xFF0F766E)),
                      title: Text(m['label'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text(m['count'] as String, style: const TextStyle(color: Colors.grey, fontSize: 13)),
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