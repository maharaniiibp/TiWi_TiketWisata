import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 180,
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(24),

        image: const DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
          ),
          fit: BoxFit.cover,
        ),
      ),

      child: Container(
        padding: const EdgeInsets.all(22),

        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(24),

          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,

            colors: [
              Colors.black.withOpacity(0.5),
              Colors.transparent,
            ],
          ),
        ),

        child: const Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          mainAxisAlignment:
              MainAxisAlignment.end,

          children: [

            Text(
              "LIMITED OFFER",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),

            SizedBox(height: 6),

            Text(
              "Explore Bali\n30% Discount",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}