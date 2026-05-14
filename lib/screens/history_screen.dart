import 'package:flutter/material.dart';

import '../storage/booking_storage.dart';

class HistoryScreen extends StatefulWidget {

  const HistoryScreen({
    super.key,
  });

  @override
  State<HistoryScreen> createState() =>
      _HistoryScreenState();
}

class _HistoryScreenState
    extends State<HistoryScreen> {

  List<Map<String, dynamic>>
      bookings = [];

  @override
  void initState() {
    super.initState();

    loadBookings();
  }

  Future<void> loadBookings()
      async {

    final data =
        await BookingStorage
            .getBookings();

    setState(() {

      bookings =
          data.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF5F5F5),

      body: SafeArea(

        child: Padding(

          padding:
              const EdgeInsets.all(
            20,
          ),

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

             


              const Text(
                "Histori Pemesanan",

                style: TextStyle(
                  fontSize: 32,

                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 2),

              const Text(
                "Lihat riwayat perjalanan dan pemesanan Anda",

                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 22),

              // SEARCH
              Container(

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                decoration:
                    BoxDecoration(

                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(
                    18,
                  ),
                ),

                child: const TextField(

                  decoration:
                      InputDecoration(

                    border:
                        InputBorder.none,

                    icon: Icon(
                      Icons.search,
                    ),

                    hintText:
                        "Cari histori pemesanan",
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // FILTER
              SingleChildScrollView(

                scrollDirection:
                    Axis.horizontal,

                // child: Row(

                //   children: [

                //     _buildFilter(
                //       "Semua",
                //       true,
                //     ),

                //     _buildFilter(
                //       "Berhasil",
                //       false,
                //     ),

                //     _buildFilter(
                //       "Pending",
                //       false,
                //     ),

                //     _buildFilter(
                //       "Dibatalkan",
                //       false,
                //     ),
                //   ],
                // ),
              ),

              const SizedBox(height: 24),

              // LIST HISTORY
              Expanded(

                child:
                    bookings.isEmpty

                        ? const Center(

                            child: Text(
                              "Belum ada booking",
                            ),
                          )

                        : ListView.builder(

                            itemCount:
                                bookings
                                    .length,

                            itemBuilder:
                                (context,
                                    index) {

                              final booking =
                                  bookings[
                                      index];

                              return Container(

                                margin:
                                    const EdgeInsets.only(
                                  bottom:
                                      18,
                                ),

                                padding:
                                    const EdgeInsets.all(
                                  14,
                                ),

                                decoration:
                                    BoxDecoration(

                                  color:
                                      Colors
                                          .white,

                                  borderRadius:
                                      BorderRadius.circular(
                                    20,
                                  ),
                                ),

                                child: Row(

                                  children: [

                                    // IMAGE
                                    ClipRRect(

                                      borderRadius:
                                          BorderRadius.circular(
                                        16,
                                      ),

                                      child:
                                          Image.network(

                                        booking[
                                            "image"],

                                        width:
                                            90,

                                        height:
                                            90,

                                        fit: BoxFit
                                            .cover,
                                      ),
                                    ),

                                    const SizedBox(
                                        width:
                                            14),

                                    // CONTENT
                                    Expanded(

                                      child:
                                          Column(

                                        crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,

                                        children: [

                                          Row(

                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,

                                            children: [

                                              Expanded(

                                                child:
                                                    Text(

                                                  booking[
                                                      "destination"],

                                                  overflow:
                                                      TextOverflow.ellipsis,

                                                  style:
                                                      const TextStyle(

                                                    fontSize:
                                                        20,

                                                    fontWeight:
                                                        FontWeight.bold,
                                                  ),
                                                ),
                                              ),

                                              Container(

                                                padding:
                                                    const EdgeInsets.symmetric(

                                                  horizontal:
                                                      10,

                                                  vertical:
                                                      4,
                                                ),

                                                decoration:
                                                    BoxDecoration(

                                                  color:
                                                      const Color(
                                                          0xFFD7F7EC),

                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    20,
                                                  ),
                                                ),

                                                child:
                                                    const Text(

                                                  "Berhasil",

                                                  style:
                                                      TextStyle(

                                                    color:
                                                        Colors.green,

                                                    fontWeight:
                                                        FontWeight.bold,

                                                    fontSize:
                                                        12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          const SizedBox(
                                              height:
                                                  8),

                                          Text(
                                            booking[
                                                "customerName"],

                                            style:
                                                const TextStyle(
                                              color:
                                                  Colors.grey,
                                            ),
                                          ),

                                          const SizedBox(
                                              height:
                                                  4),

                                          Text(
                                            "${booking["totalVisitor"]} Pengunjung",

                                            style:
                                                const TextStyle(
                                              color:
                                                  Colors.grey,
                                            ),
                                          ),

                                          const SizedBox(
                                              height:
                                                  10),

                                          Row(

                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,

                                            children: [

                                              Text(

                                                "Rp ${booking["totalPayment"]}",

                                                style:
                                                    const TextStyle(

                                                  fontSize:
                                                      22,

                                                  fontWeight:
                                                      FontWeight.bold,

                                                  color:
                                                      Color(
                                                          0xFF0066B3),
                                                ),
                                              ),

                                              const Text(

                                                "Detail >",

                                                style:
                                                    TextStyle(

                                                  color:
                                                      Color(
                                                          0xFF0066B3),

                                                  fontWeight:
                                                      FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilter(
    String title,
    bool active,
  ) {

    return Container(

      margin:
          const EdgeInsets.only(
        right: 12,
      ),

      padding:
          const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),

      decoration: BoxDecoration(

        color: active
            ? const Color(
                0xFF0066B3)
            : Colors.white,

        borderRadius:
            BorderRadius.circular(
          20,
        ),
      ),

      child: Text(

        title,

        style: TextStyle(

          color: active
              ? Colors.white
              : Colors.black,

          fontWeight:
              FontWeight.bold,
        ),
      ),
    );
  }
}