import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends HookWidget {
  final String category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  static final Map<String, Color> colorMapping = {
    'Design': Colors.purple,
    'Python': Color.fromARGB(255, 63, 126, 177),
    'Flutter': const Color.fromARGB(255, 1, 58, 105)
    // Add more text-color mappings as needed
  };

  @override
  Widget build(BuildContext context) {
    final backgroundColor = colorMapping[category] ?? Colors.grey;

    return Container(
      width: 80,
      height: 22,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          category,
          style: GoogleFonts.inter(
              textStyle: TextStyle(color: Colors.white, fontSize: 13)),
        ),
      ),
    );
  }
}
