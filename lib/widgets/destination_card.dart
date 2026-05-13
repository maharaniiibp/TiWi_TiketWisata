import 'package:flutter/material.dart';

class DestinationCard extends StatelessWidget {

  final String name;
  final String location;
  final String price;
  final String image;

  const DestinationCard({
    super.key,
    required this.name,
    required this.location,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 18),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(18),
      ),

      child: Row(
        children: [

          ClipRRect(
            borderRadius:
                const BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomLeft:
                  Radius.circular(18),
            ),

            child: Image.network(
              image,
              height: 110,
              width: 110,
              fit: BoxFit.cover,
            ),
          ),

          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.all(14),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    location,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [

                      Text(
                        price,
                        style: const TextStyle(
                          color:
                              Color(0xFF0066B3),

                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}