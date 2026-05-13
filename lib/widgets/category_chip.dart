import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {

  final String title;
  final IconData icon;

  const CategoryChip({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(30),
      ),

      child: Row(
        children: [

          Icon(
            icon,
            color: const Color(0xFF0066B3),
          ),

          const SizedBox(width: 8),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}