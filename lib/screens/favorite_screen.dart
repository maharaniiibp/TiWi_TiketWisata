import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  bool showMessage = false;

  final List<Map<String, dynamic>> favorites = [
    {
      "name": "Pura Uluwatu",
      "location": "Bali, Indonesia",
      "rating": "4.8",
      "price": "50.000",
      "image":
          "https://images.unsplash.com/photo-1512100356356-de1b84283e18",
    },
    {
      "name": "Candi Borobudur",
      "location": "Magelang, Jawa Tengah",
      "rating": "4.9",
      "price": "75.000",
      "image":
          "https://images.unsplash.com/photo-1524492412937-b28074a5d7da",
    },
    {
      "name": "Taman Bunaken",
      "location": "Manado, Sulawesi Utara",
      "rating": "4.7",
      "price": "150.000",
      "image":
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
    },
  ];

  void removeFavorite(int index) {

    setState(() {
      favorites.removeAt(index);
      showMessage = true;
    });

    Future.delayed(const Duration(seconds: 3), () {

      if (mounted) {
        setState(() {
          showMessage = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Expanded(
              child: ListView.separated(
                itemCount: favorites.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: 16),

                itemBuilder: (context, index) {

                  final item = favorites[index];

                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: Row(
                      children: [

                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            item['image'],
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [

                              Text(
                                item['name'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(item['location']),

                              const SizedBox(height: 10),

                              Row(
                                children: [

                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 18,
                                  ),

                                  const SizedBox(width: 4),

                                  Text(item['rating']),

                                  const SizedBox(width: 10),

                                  Text(
                                    "Rp ${item['price']}",
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            removeFavorite(index);
                          },

                          icon: const Icon(
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

            /// MESSAGE
            if (showMessage)
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xff2D2D2D),
                  borderRadius: BorderRadius.circular(18),
                ),

                child: Row(
                  children: [

                    const Icon(
                      Icons.check_circle_outline,
                      color: Color(0xff6EE7B7),
                    ),

                    const SizedBox(width: 12),

                    const Expanded(
                      child: Text(
                        "Favorit berhasil dihapus",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {},

                      child: const Text(
                        "URUNGKAN",
                        style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold,
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