import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/exam.dart';

typedef ExamTapCallback = void Function();

class ExamCard extends StatelessWidget {
  final Exam exam;
  final ExamTapCallback? onTap;
  final bool showStatusIcon;

  const ExamCard({
    super.key,
    required this.exam,
    this.onTap,
    this.showStatusIcon = true, required bool isPassed,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final bool isPassed = exam.dateTime.isBefore(now);

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        elevation: 3,
        color: isPassed ? Colors.red.shade200 : Colors.lightGreen.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      exam.subjectName,
                      style: GoogleFonts.montserratAlternates( 
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (showStatusIcon)
                    Icon(
                      isPassed ? Icons.check_box : Icons.punch_clock_rounded,
                      size: 22,
                    ),
                ],
              ),

              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16),
                  const SizedBox(width: 6),
                  Text(
                      "${exam.dateTime.day.toString().padLeft(2,'0')}.${exam.dateTime.month.toString().padLeft(2,'0')}.${exam.dateTime.year}",style: GoogleFonts.playfairDisplay(fontSize: 17,fontWeight: FontWeight.w400)),
                ],
              ),

              const SizedBox(height: 6),

              Row(
                children: [
                  const Icon(Icons.access_time, size: 16),
                  const SizedBox(width: 6),
                  Text(
                      "${exam.dateTime.hour.toString().padLeft(2,'0')}:${exam.dateTime.minute.toString().padLeft(2,'0')}",style: GoogleFonts.playfairDisplay(fontSize: 17,fontWeight: FontWeight.w400),),
                ],
              ),

              const SizedBox(height: 6),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on, size: 16),
                  const SizedBox(width: 6),
                  Expanded(child: Text(exam.venues.join(", "),style:GoogleFonts.lora(fontSize: 14,fontWeight: FontWeight.w400))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
