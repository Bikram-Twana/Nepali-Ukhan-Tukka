import 'package:shared_preferences/shared_preferences.dart';

import '../model/data.dart';


//finds main id from data from using ids of favorite_screens
int findIndexById(int id) {
  return allUkhans.indexWhere((element) => element.id == id);
}

//changing isFavorite value from true to false & vice-versa
change(int index) {
  allUkhans[index].isFavorite = !allUkhans[index].isFavorite;
}

//saving state of favorites
  void addOrRemoveFavouritesID(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favs = prefs.getStringList('myfav') ?? [];
    if (!favs.contains(id.toString())) {
      favs.add(id.toString());
    } else {
      favs.remove(id.toString());
    }
    await prefs.setStringList('myfav', favs);
  }

