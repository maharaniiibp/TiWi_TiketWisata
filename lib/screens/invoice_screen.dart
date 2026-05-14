import 'package:flutter/material.dart';
import 'history_screen.dart';
import '../models/destination_model.dart';

class InvoiceScreen
    extends StatelessWidget {

  final DestinationModel destination;

  final String customerName;

  final int totalVisitor;

  final int totalPayment;

  const InvoiceScreen({
    super.key,

    required this.destination,

    required this.customerName,

    required this.totalVisitor,

    required this.totalPayment,
  });

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

              children: [

                const SizedBox(height: 20),

                // SUCCESS ICON
                Container(

                  height: 110,
                  width: 110,

                  decoration:
                      BoxDecoration(
                    color:
                        Colors.tealAccent
                            .shade100,

                    shape:
                        BoxShape.circle,
                  ),

                  child: const Icon(
                    Icons.check_circle,

                    size: 60,

                    color: Colors.teal,
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Payment Successful!",

                  textAlign:
                      TextAlign.center,

                  style: TextStyle(
                    fontSize: 34,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Your travel plan is ready. Enjoy your trip!",

                  textAlign:
                      TextAlign.center,

                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 30),

                // INVOICE CARD
                Container(

                  padding:
                      const EdgeInsets.all(
                    20,
                  ),

                  decoration:
                      BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                  ),

                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                        children: [

                          const Text(
                            "Invoice Details",

                            style:
                                TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          Container(

                            padding:
                                const EdgeInsets.symmetric(
                              horizontal:
                                  14,
                              vertical: 6,
                            ),

                            decoration:
                                BoxDecoration(
                              color:
                                  Colors.teal
                                      .shade100,

                              borderRadius:
                                  BorderRadius.circular(
                                20,
                              ),
                            ),

                            child: const Text(
                              "PAID",

                              style:
                                  TextStyle(
                                color:
                                    Colors.teal,

                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Divider(
                          height: 40),

                      _buildRow(
                        "Booking ID",
                        "#TIWI-882910",
                      ),

                      _buildRow(
                        "Destination",
                        destination.location,
                      ),

                      _buildRow(
                        "Visitor Name",
                        customerName,
                      ),

                      _buildRow(
                        "Visitor Count",
                        "$totalVisitor Persons",
                      ),

                      _buildRow(
                        "Travel Date",
                        "12 Oct 2024",
                      ),

                      const Divider(
                          height: 40),

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                        children: [

                          const Text(
                            "Total Payment",

                            style:
                                TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          Flexible(
                            child: Text(
                              "Rp $totalPayment",

                              overflow:
                                  TextOverflow
                                      .ellipsis,

                              style:
                                  const TextStyle(
                                fontSize: 24,
                                fontWeight:
                                    FontWeight
                                        .bold,

                                color:
                                    Color(
                                        0xFF0066B3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

               // HISTORY BUTTON
SizedBox(

  width: double.infinity,

  height: 60,

  child: ElevatedButton(

    onPressed: () {

      Navigator.push(

        context,

        MaterialPageRoute(

          builder: (_) =>
              const HistoryScreen(),
        ),
      );
    },

    style:
        ElevatedButton
            .styleFrom(
      backgroundColor:
          const Color(
              0xFF0066B3),

      shape:
          RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(
          18,
        ),
      ),
    ),

    child: const Text(
      "View Booking History",

      style: TextStyle(
        color:
            Colors.white,

        fontSize: 18,

        fontWeight:
            FontWeight.bold,
      ),
    ),
  ),
),

                const SizedBox(height: 16),

                // BACK HOME
                SizedBox(

                  width: double.infinity,

                  height: 60,

                  child: ElevatedButton(

                    onPressed: () {

                      Navigator.popUntil(
                        context,
                        (route) =>
                            route.isFirst,
                      );
                    },

                    style:
                        ElevatedButton
                            .styleFrom(
                      backgroundColor:
                          Colors.white,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                          18,
                        ),
                      ),
                    ),

                    child: const Text(
                      "Back to Home",

                      style: TextStyle(
                        color:
                            Colors.black87,

                        fontSize: 18,

                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(
    String title,
    String value,
  ) {

    return Padding(

      padding:
          const EdgeInsets.only(
        bottom: 18,
      ),

      child: Row(
        mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,

        children: [

          Expanded(
            child: Text(
              title,

              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),

          Flexible(
            child: Text(
              value,

              textAlign:
                  TextAlign.end,

              overflow:
                  TextOverflow
                      .ellipsis,

              style: const TextStyle(
                fontSize: 16,
                fontWeight:
                    FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}