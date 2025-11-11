import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/exam.dart';
class ExamDetailsScreen extends StatelessWidget {
  final Exam exam;
  const ExamDetailsScreen({super.key, required this.exam});

   String _formatDate(DateTime dt) =>
      "${dt.day.toString().padLeft(2, '0')}.${dt.month.toString().padLeft(2, '0')}.${dt.year}";

  String _formatTime(DateTime dt) =>
      "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
   String _timeLeftLabel()
   {
    final now=DateTime.now();
    final razl=exam.dateTime.difference(now);
    final ispast=exam.dateTime.isBefore(now);
    final d=razl.abs();
    final denovi=d.inDays;
    final hours=d.inHours-denovi*24;
    final label="$denovi дена, $hours часа";
    return ispast?"Завршен испит":"Преостануваат: $label";
   }
  @override
  Widget build(BuildContext context) {
     final isPast = exam.dateTime.isBefore(DateTime.now());
    return Scaffold(
      
            appBar:AppBar(
        title: 
        Text('Детали за испитот',
        style:GoogleFonts.lora(
          fontSize:20,
          fontWeight: FontWeight.w600,
        ),),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.end,
           children:[
            Container(
  padding: const EdgeInsets.all(10),
  decoration: BoxDecoration(
    color: Colors.amber.shade900, 
    borderRadius: BorderRadius.circular(8), 
  ),
  child: Text(
    _timeLeftLabel(),
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  ),
),
            Row(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                 Expanded(child: Text(exam.subjectName,
                  style: GoogleFonts.montserratAlternates(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,)))
              ],
            ),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 25),
                const SizedBox(width: 6),
                Text(
                  "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}",style:GoogleFonts.playfairDisplay(fontSize: 20,fontWeight: FontWeight.w500)
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.access_time, size: 25),
                const SizedBox(width: 6),
                Text(
                  "${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}",style: GoogleFonts.playfairDisplay(fontSize: 21,fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, size: 25),
                const SizedBox(width: 6),
                Expanded(child: Text(exam.venues.join(", "),style:GoogleFonts.lora(fontSize: 20,fontWeight: FontWeight.w500))),
              ],
            ),
          ],
        ),
      ),
    );
  }
  }
  