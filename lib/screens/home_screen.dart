import 'package:flutter/material.dart';

import '../widgets/custom_header.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/home_banner.dart';
import '../widgets/category_chip.dart';
import '../widgets/destination_card.dart';
import '../widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:
          const Color(0xFFF5F5F5),

      bottomNavigationBar:
          const BottomNavbar(
        currentIndex: 0,
      ),

      body: SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding:
                const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                const CustomHeader(
                  title: "Hi, Explorer",
                  subtitle: "Welcome back",
                ),

                const SizedBox(height: 24),

                const SearchBarWidget(),

                const SizedBox(height: 26),

                const HomeBanner(),

                const SizedBox(height: 30),

                const Text(
                  "Kategori",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 18),

                SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal,

                  child: Row(
                    children: const [

                      CategoryChip(
                        title: "Beach",
                        icon:
                            Icons.beach_access,
                      ),

                      SizedBox(width: 12),

                      CategoryChip(
                        title: "Mountain",
                        icon:
                            Icons.landscape,
                      ),

                      SizedBox(width: 12),

                      CategoryChip(
                        title: "Museum",
                        icon: Icons.museum,
                      ),

                      SizedBox(width: 12),

                      CategoryChip(
                        title: "Park",
                        icon: Icons.park,
                      ),

                      SizedBox(width: 12),

                      CategoryChip(
                        title: "Cultural",
                        icon:
                            Icons.temple_buddhist,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Recommended",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                const DestinationCard(
                  name: "Uluwatu Temple",
                  location: "Bali",
                  price: "Rp150.000",
                  image:
                      "https://images.unsplash.com/photo-1537953773345-d172ccf13cf1",
                ),

                const DestinationCard(
                  name: "Sine Beach",
                  location: "Tulungagung",
                  price: "Rp250.000",
                  image:
                      "https://images.unsplash.com/photo-1519046904884-53103b34b206",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}