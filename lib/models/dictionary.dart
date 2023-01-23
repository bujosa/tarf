class Dictionary {
  final String phonetic;
  final List<Phonetic> phonetics;
  final List<Meaning> meanings;
  final List<String> sources;

  Dictionary(
      {required this.phonetic,
      required this.phonetics,
      required this.meanings,
      required this.sources});

  static List<String> convert(List<dynamic> list) {
    List<String> newList = [];
    for (var item in list) {
      newList.add(item);
    }

    return newList;
  }

  factory Dictionary.fromJson(Map<String, dynamic> json) {
    return Dictionary(
      phonetic: json['phonetic'] ?? '',
      // meanings: [],
      phonetics: List<Phonetic>.from(
          json['phonetics'].map((x) => Phonetic.fromJson(x))),
      meanings:
          List<Meaning>.from(json['meanings'].map((x) => Meaning.fromJson(x))),
      sources: convert(json['sourceUrls']),
    );
  }

  String getAudio() {
    for (var phonetic in phonetics) {
      if (phonetic.audio != '') {
        return phonetic.audio;
      }
    }

    return 'no audio found';
  }

  String getSource() {
    for (var source in sources) {
      if (source != '') {
        return source;
      }
    }

    return 'no source found';
  }

  String getDefinition() {
    for (var meaning in meanings) {
      for (var definition in meaning.definitions) {
        if (definition.definition != '') {
          return definition.definition;
        }
      }
    }

    return 'no definition found';
  }

  String getAntonyms() {
    String antonyms = '';

    for (var meaning in meanings) {
      for (var antonym in meaning.antonyms) {
        antonyms += '$antonym, ';
      }
    }

    if (antonyms.isNotEmpty) {
      antonyms = antonyms.substring(0, antonyms.length - 2);
    } else {
      antonyms = 'No antonyms found';
    }

    return antonyms;
  }

  String getSynonyms() {
    String synonyms = '';

    for (var meaning in meanings) {
      for (var synonym in meaning.synonyms) {
        synonyms += '$synonym, ';
      }
    }

    if (synonyms.isNotEmpty) {
      synonyms = synonyms.substring(0, synonyms.length - 2);
    } else {
      synonyms = 'No synonyms found';
    }

    return synonyms;
  }
}

class Phonetic {
  final String text;
  final String audio;

  Phonetic({required this.text, required this.audio});

  factory Phonetic.fromJson(Map<String, dynamic> json) {
    return Phonetic(
      text: json['text'],
      audio: json['audio'],
    );
  }
}

class Meaning {
  final String partOfSpeech;
  final List<DefinitionWord> definitions;
  final List<String> synonyms;
  final List<String> antonyms;

  Meaning(
      {required this.partOfSpeech,
      required this.definitions,
      required this.synonyms,
      required this.antonyms});

  factory Meaning.fromJson(Map<String, dynamic> json) {
    return Meaning(
      partOfSpeech: json['partOfSpeech'],
      definitions: List<DefinitionWord>.from(
          json['definitions'].map((x) => DefinitionWord.fromJson(x))),
      synonyms: convert(json['synonyms']),
      antonyms: convert(json['antonyms']),
    );
  }

  static List<String> convert(List<dynamic> list) {
    List<String> newList = [];
    for (var item in list) {
      newList.add(item);
    }

    return newList;
  }
}

class DefinitionWord {
  final String definition;
  final String example;
  final List<String> synonyms;
  final List<String> antonyms;

  DefinitionWord(
      {required this.definition,
      required this.example,
      required this.synonyms,
      required this.antonyms});

  factory DefinitionWord.fromJson(Map<String, dynamic> json) {
    return DefinitionWord(
        definition: json['definition'],
        example: json['example'] ?? '',
        synonyms: convert(json['synonyms']),
        antonyms: convert(json['antonyms']));
  }

  static List<String> convert(List<dynamic> list) {
    List<String> newList = [];
    for (var item in list) {
      newList.add(item);
    }

    return newList;
  }
}
