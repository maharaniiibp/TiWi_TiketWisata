import 'package:flutter/material.dart';

import '../models/destination_model.dart';
import '../storage/booking_storage.dart';
import 'invoice_screen.dart';

class CheckoutScreen
    extends StatelessWidget {

  final DestinationModel destination;

  final String customerName;

  final String phoneNumber;

  final int totalVisitor;

  const CheckoutScreen({
    super.key,

    required this.destination,

    required this.customerName,

    required this.phoneNumber,

    required this.totalVisitor,
  });

  @override
  Widget build(BuildContext context) {

    final int totalPayment =
        int.parse(destination.price) *
            totalVisitor;

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

                // HEADER
                Row(

                  children: [

                    GestureDetector(

                      onTap: () {
                        Navigator.pop(
                            context);
                      },

                      child: const CircleAvatar(
                        radius: 18,
                        backgroundColor:
                            Colors.white,

                        child: Icon(
                          Icons.arrow_back,
                          color:
                              Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    const Text(
                      "TiWi",

                      style: TextStyle(
                        fontSize: 28,
                        fontWeight:
                            FontWeight.bold,

                        color:
                            Color(0xFF0066B3),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // IMAGE
                ClipRRect(

                  borderRadius:
                      BorderRadius.circular(
                    24,
                  ),

                  child: Image.network(
                    destination.image,

                    height: 220,

                    width:
                        double.infinity,

                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 24),

                // TITLE
                Text(
                  destination.name,

                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Row(

                  children: [

                    const Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 6),

                    Text(
                      destination.location,

                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // INFO CARD
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
                      24,
                    ),
                  ),

                  child: Column(

                    children: [

                      Row(

                        children: [

                          Expanded(
                            child: _buildInfo(
                              "Visitor Name",
                              customerName,
                            ),
                          ),

                          Expanded(
                            child: _buildInfo(
                              "Phone Number",
                              phoneNumber,
                            ),
                          ),
                        ],
                      ),

                      const Divider(
                          height: 40),

                      Row(

                        children: [

                          Expanded(
                            child: _buildInfo(
                              "Visitors",
                              "$totalVisitor Person",
                            ),
                          ),

                          Expanded(
                            child: _buildInfo(
                              "Travel Date",
                              "12 Oct 2024",
                            ),
                          ),
                        ],
                      ),

                      const Divider(
                          height: 40),

                      Row(

                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                        children: [

                          const Text(
                            "Price per person",

                            style:
                                TextStyle(
                              color:
                                  Colors.grey,

                              fontSize: 16,
                            ),
                          ),

                          Text(
                            "Rp ${destination.price}",

                            style:
                                const TextStyle(
                              fontSize: 18,

                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                          height: 20),

                      Row(

                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,

                        children: [

                          const Text(
                            "Total Payment",

                            style:
                                TextStyle(
                              fontSize: 24,

                              fontWeight:
                                  FontWeight
                                      .bold,
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
                                fontSize: 30,

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

                // PAY BUTTON
                SizedBox(

                  width: double.infinity,

                  height: 64,

                  child: ElevatedButton(

                    onPressed: () async {

                      final booking = {

                        "destination":
                            destination.name,

                        "location":
                            destination.location,

                        "image":
                            destination.image,

                        "customerName":
                            customerName,

                        "phoneNumber":
                            phoneNumber,

                        "totalVisitor":
                            totalVisitor,

                        "totalPayment":
                            totalPayment,
                      };

                      await BookingStorage
                          .saveBooking(
                        booking,
                      );

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) =>
                              InvoiceScreen(

                            destination:
                                destination,

                            customerName:
                                customerName,

                            totalVisitor:
                                totalVisitor,

                            totalPayment:
                                totalPayment,
                          ),
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
                          20,
                        ),
                      ),
                    ),

                    child: const Text(
                      "Pay Now",

                      style: TextStyle(
                        fontSize: 20,

                        fontWeight:
                            FontWeight.bold,

                        color:
                            Colors.white,
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

  Widget _buildInfo(
    String title,
    String value,
  ) {

    return Column(

      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Text(
          title,

          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          value,

          overflow:
              TextOverflow.ellipsis,

          style: const TextStyle(
            fontSize: 20,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ],
    );
  }
}