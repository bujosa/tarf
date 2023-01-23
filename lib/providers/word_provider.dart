import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:tarf/models/dictionary.dart';
import 'package:tarf/models/pixel.dart';

class WordProvider extends ChangeNotifier {
  late SharedPreferences prefs;

  bool isLoaded = false;
  String word = '';
  List<String> pictures = [];
  Dictionary dictionary = Dictionary(
    phonetics: [],
    meanings: [
      Meaning(partOfSpeech: 'Not Found', definitions: [
        DefinitionWord(
          definition: 'Not Found',
          antonyms: [],
          example: '',
          synonyms: [],
        )
      ], antonyms: [], synonyms: [])
    ],
    phonetic: '',
    sources: [],
  );

  final String _dictionaryApi = dotenv.env['DICTIONARY_API']!;
  final String _pictureApi = dotenv.env['PICTURE_API']!;
  final String _wordApi = dotenv.env['WORD_API']!;
  final String _pictureApiToken = dotenv.env['PICTURE_API_TOKEN']!;

  WordProvider() {
    _loadWord();
  }

  Future<void> _loadWord() async {
    prefs = await SharedPreferences.getInstance();
    String? today = prefs.getString('today_key');

    if (today == null || today != this.today) {
      word = (await fetchWord()).body.split('"')[1];
      word = word[0].toUpperCase() + word.substring(1);
      await prefs.setString('word_key', word);
      await prefs.setString('today_key', this.today);

      fetchPictures();
    } else {
      word = prefs.getString('word_key')!;
      pictures = prefs.getStringList('pictures_key')!;
    }

    fetchDictionary();

    isLoaded = true;

    notifyListeners();
  }

  Future<http.Response> fetchWord() {
    Random random = Random();
    int randomNumber = random.nextInt(8) + 1;

    return http.get(Uri.parse('$_wordApi?length=$randomNumber'));
  }

  void fetchDictionary() async {
    late Future<http.Response> response =
        http.get(Uri.parse('$_dictionaryApi${word.toLowerCase()}'));

    await response.then((value) {
      var jsonResponse = jsonDecode(value.body);

      if (jsonResponse[0]['title'] == null) {
        dictionary = Dictionary.fromJson(jsonResponse[0]);
      }
    });

    notifyListeners();
  }

  void fetchPictures() async {
    late Future<http.Response> response = http.get(
        Uri.parse('$_pictureApi${word.toLowerCase()}&per_page=5'),
        headers: {
          'Authorization': _pictureApiToken,
        });

    await response.then((value) {
      PixelApi pixelApi = PixelApi.fromJson(jsonDecode(value.body));
      for (int i = 0; i < pixelApi.photos.length; i++) {
        pictures.add(pixelApi.photos[i].src.medium);
      }
    });

    await prefs.setStringList('pictures_key', pictures);
    notifyListeners();
  }

  String get today {
    return DateTime.now().toString().substring(0, 10);
  }
}
