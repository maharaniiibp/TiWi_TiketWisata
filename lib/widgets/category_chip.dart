import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {

  final String title;
  final IconData icon;

  final bool isSelected;

  final VoidCallback onTap;

  const CategoryChip({
    super.key,

    required this.title,
    required this.icon,

    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        padding:
            const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14,
        ),

        decoration: BoxDecoration(

          color: isSelected
              ? const Color(0xFF0066B3)
              : Colors.white,

          borderRadius:
              BorderRadius.circular(
            30,
          ),

          boxShadow: [

            BoxShadow(

              color: Colors.black
                  .withOpacity(0.04),

              blurRadius: 10,

              offset: const Offset(
                0,
                4,
              ),
            ),
          ],
        ),

        child: Row(

          children: [

            Icon(

              icon,

              size: 20,

              color: isSelected
                  ? Colors.white
                  : const Color(
                      0xFF0066B3),
            ),

            const SizedBox(width: 8),

            Text(

              title,

              style: TextStyle(

                fontSize: 15,

                fontWeight:
                    FontWeight.w600,

                color: isSelected
                    ? Colors.white
                    : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}