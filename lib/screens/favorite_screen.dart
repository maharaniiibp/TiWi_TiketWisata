import 'package:flutter/material.dart';

import '../storage/favorite_storage.dart';

class FavoriteScreen
    extends StatefulWidget {

  const FavoriteScreen({
    super.key,
  });

  @override
  State<FavoriteScreen>
      createState() =>
          _FavoriteScreenState();
}

class _FavoriteScreenState
    extends State<FavoriteScreen> {

  List<Map<String, dynamic>>
      favorites = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    loadFavorites();
  }

  Future<void> loadFavorites()
      async {

    final data =
        await FavoriteStorage
            .getFavorites();

    setState(() {

      favorites = data;

      isLoading = false;
    });
  }

  Future<void> removeFavorite(
    int index,
  ) async {

    final item = favorites[index];

    await FavoriteStorage
        .removeFavorite(item);

    setState(() {
      favorites.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xffF5F7FA),

      body: Padding(

        padding:
            const EdgeInsets.all(20),

        child: isLoading

            ? const Center(
                child:
                    CircularProgressIndicator(),
              )

            : favorites.isEmpty

                ? const Center(

                    child: Text(
                      "Belum ada favorite ❤️",
                    ),
                  )

                : ListView.separated(

                    itemCount:
                        favorites.length,

                    separatorBuilder:
                        (_, __) =>
                            const SizedBox(
                      height: 16,
                    ),

                    itemBuilder:
                        (context, index) {

                      final item =
                          favorites[index];

                      return Container(

                        padding:
                            const EdgeInsets.all(
                          14,
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

                          children: [

                            // IMAGE
                            ClipRRect(

                              borderRadius:
                                  BorderRadius.circular(
                                14,
                              ),

                              child:
                                  Image.network(

                                item['image'],

                                width: 90,
                                height: 90,

                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(
                                width: 14),

                            // CONTENT
                            Expanded(

                              child: Column(

                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                children: [

                                  Text(

                                    item['name'],

                                    style:
                                        const TextStyle(

                                      fontSize:
                                          20,

                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(
                                      height:
                                          6),

                                  Text(
                                    item['location'],
                                  ),

                                  const SizedBox(
                                      height:
                                          10),

                                  Text(

                                    "Rp ${item['price']}",

                                    style:
                                        const TextStyle(

                                      color:
                                          Colors.blue,

                                      fontWeight:
                                          FontWeight.bold,

                                      fontSize:
                                          18,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // REMOVE FAVORITE
                            IconButton(

                              onPressed: () {
                                removeFavorite(
                                  index,
                                );
                              },

                              icon:
                                  const Icon(

                                Icons.favorite,

                                color: Colors.red,

                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}