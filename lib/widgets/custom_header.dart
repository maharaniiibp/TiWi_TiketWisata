import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {

  const CustomHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,

      children: [

        // TEXT
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: const [

            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
                fontWeight:
                    FontWeight.w500,
              ),
            ),

            SizedBox(height: 2),

            Text(
              "Hi, ExploTiWi",
              style: TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
                color:
                    Color(0xFF0066B3),
              ),
            ),
          ],
        ),

        // PROFILE IMAGE
        Container(
          height: 40,
          width: 40,

          decoration: BoxDecoration(
            shape: BoxShape.circle,

            border: Border.all(
              color:
                  const Color(0xFF0066B3),
              width: 2,
            ),
          ),

          child: ClipOval(

            child: Image.asset(
              'assets/images/Profile.png',

              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}