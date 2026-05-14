import 'package:flutter/material.dart';

import '../widgets/search_bar_widget.dart';
import '../widgets/home_banner.dart';
import '../widgets/category_chip.dart';
import '../widgets/destination_card.dart';

import '../models/destination_model.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState
    extends State<HomeScreen> {

  late Future<List<DestinationModel>>
      destinations;

  @override
  void initState() {
    super.initState();

    destinations =
        ApiService.fetchDestinations();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF5F5F5),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(

            padding:
                const EdgeInsets.all(20),

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                // SEARCH BAR
                const SearchBarWidget(),

                const SizedBox(height: 26),

                // BANNER
                const HomeBanner(),

                const SizedBox(height: 30),

                // CATEGORY TITLE
                const Text(
                  "Kategori",

                  style: TextStyle(
                    fontSize: 24,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 18),

                // CATEGORY LIST
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
                        icon:
                            Icons.museum,
                      ),

                      SizedBox(width: 12),

                      CategoryChip(
                        title: "Park",
                        icon:
                            Icons.park,
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

                const SizedBox(height: 34),

                // RECOMMENDED TITLE
                Row(

                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,

                  children: const [

                    Text(
                      "Recommended",

                      style: TextStyle(
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    Text(
                      "See All",

                      style: TextStyle(
                        color:
                            Color(0xFF0066B3),

                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // API DATA
                FutureBuilder<
                    List<DestinationModel>>(

                  future: destinations,

                  builder:
                      (context, snapshot) {

                    // LOADING
                    if (snapshot
                            .connectionState ==
                        ConnectionState
                            .waiting) {

                      return const Center(
                        child:
                            CircularProgressIndicator(),
                      );
                    }

                    // ERROR
                    if (snapshot.hasError) {

                      return const Text(
                        "Gagal mengambil data",
                      );
                    }

                    // EMPTY
                    if (!snapshot.hasData ||
                        snapshot.data!.isEmpty) {

                      return const Text(
                        "Data kosong",
                      );
                    }

                    // DATA
                    final data =
                        snapshot.data!;

                    return ListView.builder(

                      itemCount:
                          data.length,

                      shrinkWrap: true,

                      physics:
                          const NeverScrollableScrollPhysics(),

                      itemBuilder:
                          (context, index) {

                        final destination =
                            data[index];

                        return DestinationCard(
                          destination:
                              destination,
                        );
                      },
                    );
                  },
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}