import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkshopDetail extends HookWidget {
  final String workshopName;
  final String room;
  final String block;
  final String peopleNumber;

  WorkshopDetail({
    Key? key,
    required this.workshopName,
    required this.room,
    required this.block,
    required this.peopleNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          workshopName,
          style: GoogleFonts.inter(
              textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ),
        const SizedBox(height: 8),
        Text(
          "Room $room - Block $block",
          style: GoogleFonts.inter(textStyle: const TextStyle(fontSize: 12, color: Colors.grey)),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.person_2_outlined,
              color: Colors.grey,
              size: 12,
            ),
            SizedBox(width: 3),
            Text(
              peopleNumber,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(fontSize: 12,
                color: Colors.grey,))
            ),
          ],
        ),
    );
  }
}
