// import 'package:translator/translator.dart';

class Ukhan {
  int id;
  String ukhan = '';
  bool isFavorite = false;
  Ukhan(this.id, this.ukhan, [isFavorite = false]);
}

List<Ukhan> allUkhans = [
  Ukhan(1, "हात्ती चढिसकेको मान्छेले गधा चढ्न के रुचाउला !"),
  Ukhan(2, "हत्केलामा तोरी उम्रदैन !"),
  Ukhan(3, "हिराको मोल किराले जान्दैन! "),
  Ukhan(4, "हेर्दाको राम्रो, दिन खानको चाम्रो !"),
  Ukhan(5, "हल्लिएको दाँत एकदिन फुक्लन्छ !"),
  Ukhan(6, "हाँसी हाँसी कसेको गाँठो रोई रोई फुकाउनु पर्छ !"),
  Ukhan(7, "हर्रो नपाउनेलाई जाईफल !"),
  Ukhan(8, "हँसियाको बिहेमा खुर्पाको गीत !"),
  Ukhan(9, "सुघरी स्वास्निको पोइ मोटाउछ !"),
  Ukhan(10, "फोहोरी स्वास्निको कुकुर मोटाउछ !"),
];

//converting english numeric letters to nepali
const Map<String, String> _numeric = {
  "1": "१",
  "2": "२",
  "3": "३",
  "4": "४",
  "5": "५",
  "6": "६",
  "7": "७",
  "8": "८",
  "9": "९",
  "10": "१०",
};

String getNepaliNumberFromText(String value) =>
    value.split('').map((e) => _numeric[e] ?? e).toList().join("");

String getNepaliNumber(num value) => getNepaliNumberFromText(value.toString());

// using flutter language translation package
// List<Ukhan> translatedToEnglishUkhans = List.filled(10, Ukhan(0, ""));

// void convertToEnglish() async {
//     final translator = GoogleTranslator();
//   for (int i = 0; i < allUkhans.length; i++) {
//     await translator
//         .translate(allUkhans[i].ukhan, from: 'ne', to: 'en')
//         .then((value) {
//       translatedToEnglishUkhans[i].id = i + 1;
//       translatedToEnglishUkhans[i].ukhan = value.toString();
//     });
//   }
// }
