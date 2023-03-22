import 'package:flutter/material.dart';
import 'package:nepali_ukhan_tukka/controller/utils.dart';
import 'package:nepali_ukhan_tukka/model/data.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Ukhan> favoriteUkhans =
      allUkhans.where((element) => element.isFavorite == true).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Ukhans"), actions: const []),
      body: favoriteUkhans.isEmpty
          ? const Center(
              child: Text(
              "No Favorites. You can add from homepage.",
              style: TextStyle(fontSize: 18),
            ))
          : ListView.builder(
              itemCount: favoriteUkhans.length,
              itemBuilder: (ctx, ind) {
                return Card(
                  child: ListTile(
                    title: Text(
                      '${getNepaliNumber(ind + 1)}. ${favoriteUkhans[ind].ukhan}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          int index1 = findIndexById(favoriteUkhans[ind].id);
                          setState(() {
                            change(index1);
                            addOrRemoveFavouritesID(allUkhans[ind].id);
                          });
                        },
                        icon: favoriteUkhans[ind].isFavorite
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(Icons.favorite_border_sharp)),
                  ),
                );
              }),
    );
  }
}
