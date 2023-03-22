import 'package:flutter/material.dart';
import 'package:nepali_ukhan_tukka/controller/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/data.dart';
import 'favorite_screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isEnglish = false;

  // this will be called after selecting option from dropdown menu
  void saveLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isEng', isEnglish);
  }

  //saved state loading function
  void loadLanguage() {
    // //also can be done like this
    // final prefs = await SharedPreferences.getInstance();
    // ( isEnglish = prefs.getBool('isEng') ?? true; ) inside setState. same is done as below.
    SharedPreferences.getInstance().then((value) {
      setState(() {
        isEnglish = value.getBool('isEng') ?? true;
      });
    });
  }

  //loading state of favorites
  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favs = prefs.getStringList('myfav') ?? [];
    for (int i = 0; i < favs.length; i++) {
      int index = findIndexById(int.parse(favs[i]));
      allUkhans[index].isFavorite = true;
    }
  }

  @override
  void initState() {
    // Calling intial load language, which is not available on first time. so set default to english
    loadLanguage();
    loadFavorites();
    // convertToEnglish();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nepali Ukhan Tukka"),
        actions: [
          //DropDown of two option that is going to be saved on local storage
          DropdownButton(
            items: const [
              DropdownMenuItem(
                child: Text("English"),
                value: "English",
              ),
              DropdownMenuItem(
                child: Text("Nepali"),
                value: "Nepali",
              ),
            ],
            onChanged: (value) {
              setState(() {
                if (value == "English") {
                  isEnglish = true;
                } else {
                  isEnglish = false;
                }
                saveLanguage();
              });
            },
            value: isEnglish ? "English" : "Nepali",
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Home"),
              trailing: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Favorites"),
              trailing: const Icon(Icons.favorite),
              onTap: () {
                //then is added to send refresh updated on home_screens.
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FavoriteScreen()))
                    .then((value) => {
                          setState(
                            () {},
                          )
                        });
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: allUkhans.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: isEnglish
                    ? Text(
                        // '${(index + 1)}. ${(translatedToEnglishUkhans[index].ukhan)}',
                        '${(index + 1)}. ${(allUkhans[index].ukhan)}',
                        style: const TextStyle(fontSize: 20),
                      )
                    : Text(
                        '${getNepaliNumber(index + 1)}. ${(allUkhans[index].ukhan)}',
                        style: const TextStyle(fontSize: 20),
                      ),
                trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        allUkhans[index].isFavorite =
                            !allUkhans[index].isFavorite;
                        addOrRemoveFavouritesID(allUkhans[index].id);
                      });
                    },
                    icon: allUkhans[index].isFavorite
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
