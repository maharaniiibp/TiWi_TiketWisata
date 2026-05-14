import 'package:flutter/material.dart';

import '../models/destination_model.dart';
import '../screens/detail_screen.dart';

class DestinationCard extends StatelessWidget {

  final DestinationModel destination;

  const DestinationCard({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: () {

        Navigator.push(

          context,

          MaterialPageRoute(

            builder: (context) =>
                DetailScreen(
              destination:
                  destination,
            ),
          ),
        );
      },

      child: Container(

        margin:
            const EdgeInsets.only(
          bottom: 20,
        ),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(24),
        ),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            ClipRRect(

              borderRadius:
                  const BorderRadius.only(
                topLeft:
                    Radius.circular(24),

                topRight:
                    Radius.circular(24),
              ),

              child: Image.network(

                destination.image,

                height: 220,

                width: double.infinity,

                fit: BoxFit.cover,
              ),
            ),

            Padding(

              padding:
                  const EdgeInsets.all(18),

              child: Row(

                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                children: [

                  Column(

                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [

                      Text(

                        destination.name,

                        style:
                            const TextStyle(
                          fontSize: 24,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                          height: 8),

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
                            destination
                                .location,

                            style:
                                const TextStyle(
                              color:
                                  Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Text(

                    "Rp ${destination.price}",

                    style:
                        const TextStyle(
                      color:
                          Color(0xFF0066B3),

                      fontWeight:
                          FontWeight.bold,

                      fontSize: 22,
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