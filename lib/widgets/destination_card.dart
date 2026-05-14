import 'package:flutter/material.dart';

import '../models/destination_model.dart';
import '../screens/detail_screen.dart';
import '../storage/favorite_storage.dart';

class DestinationCard
    extends StatefulWidget {

  final DestinationModel
      destination;

  const DestinationCard({
    super.key,
    required this.destination,
  });

  @override
  State<DestinationCard>
      createState() =>
          _DestinationCardState();
}

class _DestinationCardState
    extends State<DestinationCard> {

  bool isFavorite = false;

  Future<void> toggleFavorite()
      async {

   final data = {

  "name":
      widget.destination.name,

  "location":
      widget.destination.location,

  "image":
      widget.destination.image,

  "price":
      widget.destination.price,

  "category":
      widget.destination.category,
};

    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {

      await FavoriteStorage
          .saveFavorite(data);

    } else {

      await FavoriteStorage
          .removeFavorite(data);
    }
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: () {

        Navigator.push(

          context,

          MaterialPageRoute(

            builder: (_) =>
                DetailScreen(
              destination:
                  widget.destination,
            ),
          ),
        );
      },

      child: Container(

        margin:
            const EdgeInsets.only(
          bottom: 18,
        ),

        decoration: BoxDecoration(

          color: Colors.white,

          borderRadius:
              BorderRadius.circular(
            20,
          ),

          boxShadow: [

            BoxShadow(

              color: Colors.black
                  .withOpacity(0.05),

              blurRadius: 10,

              offset:
                  const Offset(0, 4),
            ),
          ],
        ),

        child: Row(

          children: [

            // IMAGE
            ClipRRect(

              borderRadius:
                  const BorderRadius.only(

                topLeft:
                    Radius.circular(20),

                bottomLeft:
                    Radius.circular(20),
              ),

              child: Image.network(

                widget.destination.image,

                width: 110,
                height: 110,

                fit: BoxFit.cover,

                errorBuilder:
                    (_, __, ___) {

                  return Container(

                    width: 110,
                    height: 110,

                    color:
                        Colors.grey[300],

                    child: const Icon(
                      Icons.image,
                    ),
                  );
                },
              ),
            ),

            Expanded(

              child: Padding(

                padding:
                    const EdgeInsets.all(
                  14,
                ),

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                  children: [

                    Text(

                      widget.destination
                          .name,

                      maxLines: 1,

                      overflow:
                          TextOverflow
                              .ellipsis,

                      style:
                          const TextStyle(

                        fontSize: 20,

                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),

                    const SizedBox(
                        height: 6),

                    Text(

                      widget.destination
                          .location,

                      style:
                          const TextStyle(
                        color:
                            Colors.grey,
                      ),
                    ),

                    const SizedBox(
                        height: 12),

                    Row(

                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,

                      children: [

                        Text(

                          "Rp ${widget.destination.price}",

                          style:
                              const TextStyle(

                            color: Color(
                                0xFF0066B3),

                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),

                        GestureDetector(

                          onTap:
                              toggleFavorite,

                          child: Icon(

                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,

                            color:
                                Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}