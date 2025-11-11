
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/exam.dart';
import '../widgets/Exam_card.dart';
import 'details.dart';
import 'package:badges/badges.dart' as badges;

class Raspored extends StatefulWidget {
  const Raspored({super.key});

  @override
  State<Raspored> createState() => _RasporedState();
}

class _RasporedState extends State<Raspored> {
  final List<Exam> exams = [
    Exam(
      subjectName: "Структурно програмирање",
      dateTime: DateTime(2025, 12, 8, 9, 0),
      venues: ["АМФИ 1", "ЛАБ 203"],
    ),
    Exam(
      subjectName: "Математика 1",
      dateTime: DateTime(2025, 10, 10, 11, 0),
      venues: ["АМФИ 2", "ЛАБ 118"],
    ),
    Exam(
      subjectName: "Објектно програмирање",
      dateTime: DateTime(2025, 12, 15, 9, 30),
      venues: ["АМФИ 3", "ЛАБ:202"],
    ),
    Exam(
      subjectName: "Aлгоритми и податочни структури",
      dateTime: DateTime(2025, 12, 5, 13, 30),
      venues: ["АМФИ 3", "ЛАБ 200AB"],
    ),
    Exam(
      subjectName: "Математика 2",
      dateTime: DateTime(2025, 10, 22, 14, 0),
      venues: ["АМФИ 3", "ЛАБ 113"],
    ),
    Exam(
      subjectName: "Мобилни информациски системи",
      dateTime: DateTime(2025, 12, 16, 9, 0),
      venues: ["АМФИ 7", "ЛАБ 3"],
    ),
    Exam(
      subjectName: "Пресметување во облак",
      dateTime: DateTime(2025, 12, 19, 9, 0),
      venues: ["АМФИ 5", "ЛАБ 111"],
    ),
    Exam(
      subjectName: "Дистрибуирани системи",
      dateTime: DateTime(2025, 12, 19, 12, 30),
      venues: ["АМФИ 2", "ЛАБ 52"],
    ),
    Exam(
      subjectName: "Информациска безбедност",
      dateTime: DateTime(2025, 10, 16, 9, 0),
      venues: ["АМФИ 7", "ЛАБ 3"],
    ),
    Exam(
      subjectName: "Напредно програмирање",
      dateTime: DateTime(2025, 12, 5, 2, 0),
      venues: ["АМФИ 7", "ЛАБ 3"],
    ),
    Exam(
      subjectName: "Роботика",
      dateTime: DateTime(2025, 12, 7, 9, 0),
      venues: ["АМФИ 7", "ЛАБ 3"],
    ),
    Exam(
      subjectName: "Мрежна безбедност",
      dateTime: DateTime(2025, 12, 27, 12, 30),
      venues: ["АМФИ 7", "ЛАБ 3"],
    ),
  ];

  bool _isAscending = true;

  @override
  void initState() {
    super.initState();
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    _isAscending = true;
  }

  void _SortOrder() {
    setState(() {
      _isAscending = !_isAscending;
      exams.sort((a, b) =>
          _isAscending ? a.dateTime.compareTo(b.dateTime) : b.dateTime.compareTo(a.dateTime));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Распоред за испити-[222006]',
          style: GoogleFonts.lora(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isAscending ? Icons.arrow_circle_up : Icons.arrow_circle_down,
              size: 30,
              color: Colors.amber.shade900,
            ),
            onPressed: _SortOrder
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return ExamCard(
  isPassed: exam.dateTime.isBefore(DateTime.now()),
  exam: exam,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ExamDetailsScreen(exam: exam)),
    );
  },
);
        },
      ),

      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: badges.Badge(
              badgeContent: Text('${exams.length}'),
              badgeStyle: const badges.BadgeStyle(
                badgeColor: Colors.deepOrangeAccent
              ),
              position: badges.BadgePosition.bottomEnd(),
              child: const Icon(
                Icons.assessment,
                size: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
