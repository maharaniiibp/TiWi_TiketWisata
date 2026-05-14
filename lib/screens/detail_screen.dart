import 'package:flutter/material.dart';

import '../models/destination_model.dart';
import 'checkout_screen.dart';

class DetailScreen extends StatefulWidget {

  final DestinationModel destination;

  const DetailScreen({
    super.key,
    required this.destination,
  });

  @override
  State<DetailScreen> createState() =>
      _DetailScreenState();
}

class _DetailScreenState
    extends State<DetailScreen> {

  int totalVisitor = 2;

  final TextEditingController
      nameController =
          TextEditingController();

  final TextEditingController
      phoneController =
          TextEditingController();

  @override
  Widget build(BuildContext context) {

    final int price =
        int.tryParse(
              widget.destination.price,
            ) ??
            0;

    final int totalPrice =
        price * totalVisitor;

    return Scaffold(

      backgroundColor:
          const Color(0xFFF5F5F5),

      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // IMAGE
            Stack(
              children: [

                Image.network(
                  widget.destination.image,

                  height: 320,

                  width: double.infinity,

                  fit: BoxFit.cover,
                ),

                // HEADER
                Positioned(
                  top: 50,
                  left: 20,
                  right: 20,

                  child: Row(
                    children: [

                      GestureDetector(

                        onTap: () {
                          Navigator.pop(
                              context);
                        },

                        child: Container(

                          padding:
                              const EdgeInsets.all(
                            10,
                          ),

                          decoration:
                              const BoxDecoration(
                            color: Colors.white,
                            shape:
                                BoxShape.circle,
                          ),

                          child: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),

                      const SizedBox(
                          width: 14),

                      const Text(
                        "TiWi",

                        style: TextStyle(
                          fontSize: 26,
                          fontWeight:
                              FontWeight.bold,

                          color:
                              Color(
                                  0xFF0066B3),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(

              padding:
                  const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  // TITLE CARD
                  Container(

                    padding:
                        const EdgeInsets.all(
                      18,
                    ),

                    decoration:
                        BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                          BorderRadius.circular(
                        18,
                      ),
                    ),

                    child: Column(
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
                              child: Text(
                                widget
                                    .destination
                                    .name,

                                style:
                                    const TextStyle(
                                  fontSize:
                                      28,

                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                            ),

                            Container(

                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal:
                                    12,
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
                                "⭐ 4.8",
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                            height: 10),

                        Row(
                          children: [

                            const Icon(
                              Icons.location_on,
                              color:
                                  Colors.grey,
                              size: 18,
                            ),

                            const SizedBox(
                                width: 4),

                            Text(
                              widget
                                  .destination
                                  .location,

                              style:
                                  const TextStyle(
                                color:
                                    Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                            height: 18),

                        const Text(
                          "Beautiful tourism destination with amazing scenery and unforgettable experience.",

                          style: TextStyle(
                            height: 1.8,
                            color:
                                Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // VISITOR TITLE
                  const Text(
                    "Select Visitors",

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // VISITOR BOX
                  Container(

                    padding:
                        const EdgeInsets.all(
                      18,
                    ),

                    decoration:
                        BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                          BorderRadius.circular(
                        18,
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,

                      children: [

                        const Column(
                          crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,

                          children: [

                            Text(
                              "Total Tickets",

                              style: TextStyle(
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              "Adults (Age 12+)",

                              style: TextStyle(
                                color:
                                    Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [

                            // MINUS
                            GestureDetector(

                              onTap: () {

                                if (totalVisitor >
                                    1) {

                                  setState(() {

                                    totalVisitor--;
                                  });
                                }
                              },

                              child: Container(

                                height: 36,
                                width: 36,

                                decoration:
                                    BoxDecoration(
                                  border:
                                      Border.all(
                                    color:
                                        Colors.blue,
                                  ),

                                  shape:
                                      BoxShape
                                          .circle,
                                ),

                                child: const Icon(
                                  Icons.remove,
                                  color:
                                      Colors.blue,
                                ),
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal:
                                    18,
                              ),

                              child: Text(

                                totalVisitor
                                    .toString(),

                                style:
                                    const TextStyle(
                                  fontSize: 24,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                            ),

                            // PLUS
                            GestureDetector(

                              onTap: () {

                                setState(() {

                                  totalVisitor++;
                                });
                              },

                              child: Container(

                                height: 36,
                                width: 36,

                                decoration:
                                    const BoxDecoration(
                                  color:
                                      Colors.blue,

                                  shape:
                                      BoxShape
                                          .circle,
                                ),

                                child: const Icon(
                                  Icons.add,
                                  color:
                                      Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // FORM TITLE
                  const Text(
                    "Visitor Details",

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // FULL NAME
                  TextField(

                    controller:
                        nameController,

                    decoration:
                        InputDecoration(
                      hintText:
                          "Full Name",

                      filled: true,

                      fillColor:
                          Colors.white,

                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                          14,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // PHONE
                  TextField(

                    controller:
                        phoneController,

                    decoration:
                        InputDecoration(
                      hintText:
                          "Phone Number",

                      filled: true,

                      fillColor:
                          Colors.white,

                      border:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                          14,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // PRICE SUMMARY
                  Container(

                    padding:
                        const EdgeInsets.all(
                      20,
                    ),

                    decoration:
                        BoxDecoration(
                      color:
                          Colors.blue.shade50,

                      borderRadius:
                          BorderRadius.circular(
                        18,
                      ),
                    ),

                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,

                          children: [

                            Text(
                              "Ticket Price x$totalVisitor",
                            ),

                            Text(
                              "Rp $totalPrice",
                            ),
                          ],
                        ),

                        const SizedBox(
                            height: 10),

                        

                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,

                          children: [

                            const Text(
                              "Total Amount",

                              style: TextStyle(
                                fontSize: 20,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),

                            Text(

                            "Rp $totalPrice",

                              style:
                                  const TextStyle(
                                fontSize: 22,
                                fontWeight:
                                    FontWeight
                                        .bold,

                                color:
                                    Color(
                                        0xFF0066B3),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // CHECKOUT BUTTON
                  SizedBox(

                    width: double.infinity,

                    height: 60,

                    child: ElevatedButton(

                      onPressed: () {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder:
                                (context) =>
                                    CheckoutScreen(

                              destination:
                                  widget
                                      .destination,

                              totalVisitor:
                                  totalVisitor,

                              customerName:
                                  nameController
                                      .text,

                              phoneNumber:
                                  phoneController
                                      .text,
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
                            18,
                          ),
                        ),
                      ),

                      child: const Text(
                        "Checkout Now",

                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}