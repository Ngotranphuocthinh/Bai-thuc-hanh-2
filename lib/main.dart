import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class Student {
  final String name;
  final String? email;
  final String? phone;

  const Student({required this.name, this.email, this.phone});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentListScreen(),
    );
  }
}

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  static const List<Student> students = [
    Student(name: 'Nguyễn Văn An', email: 'an@sv.edu.vn', phone: '0901 234 567'),
    Student(name: 'Trần Thị Bình', email: null, phone: '0912 888 999'),
    Student(name: 'Lê Minh Chi', email: 'chi@sv.edu.vn', phone: null),
    Student(name: 'Phạm Quốc Dũng', email: null, phone: null),
    Student(name: 'Võ Thanh Em', email: 'em@sv.edu.vn', phone: '0933 111 222'),
  ];

  Widget _infoRow(String label, String? value) {
    final bool isMissing = value == null;
    return Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
        ),
        Text(
          value ?? 'Chưa cập nhật',
          style: TextStyle(
            fontSize: 13,
            color: isMissing ? const Color(0xFFD32F2F) : const Color(0xFF6B7280),
            fontStyle: isMissing ? FontStyle.italic : FontStyle.normal,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> cards = [];
    for (final s in students) {
      cards.add(
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 6),
              _infoRow('Email', s.email),
              const SizedBox(height: 4),
              _infoRow('SĐT', s.phone),
            ],
          ),
        ),
      );
      cards.add(const SizedBox(height: 12));
    }

    int missingEmail = 0;
    for (final s in students) {
      if (s.email == null) {
        missingEmail++;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF3F5FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C4A7C),
        foregroundColor: Colors.white,
        title: const Text('Danh sách sinh viên'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ...cards,
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8EDF7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tổng: ${students.length} sinh viên',
                        style: const TextStyle(color: Color(0xFF2C4A7C))),
                    Text('Thiếu email: $missingEmail',
                        style: const TextStyle(
                            color: Color(0xFFD32F2F),
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}