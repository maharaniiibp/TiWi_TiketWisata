import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {

  final String title;
  final String subtitle;

  const CustomHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,

      children: [

        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0066B3),
              ),
            ),
          ],
        ),

        const CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(
            "https://i.pravatar.cc/150?img=12",
          ),
        ),
      ],
    );
  }
}