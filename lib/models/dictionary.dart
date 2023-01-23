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

  factory Dictionary.fromJson(Map<String, dynamic> json) {
    return Dictionary(
      phonetic: json['phonetic'],
      phonetics: List<Phonetic>.from(
          json['phonetics'].map((x) => {Phonetic.fromJson(x)})),
      meanings: List<Meaning>.from(
          json['meanings'].map((x) => {Meaning.fromJson(x)})),
      sources: json['sources'],
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

  String getAntonims() {
    String antonims = '';

    for (var meaning in meanings) {
      for (var antonym in meaning.antonyms) {
        antonims += '$antonym, ';
      }
    }

    if (antonims.isNotEmpty) {
      antonims = antonims.substring(0, antonims.length - 2);
    } else {
      antonims = 'No antonyms found';
    }

    return antonims;
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

  String getAudioUrl() {
    return audio;
  }
}

class Meaning {
  final String partOfSpeech;
  final List<Definition> definitions;
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
      definitions: List<Definition>.from(
          json['definitions'].map((x) => {Definition.fromJson(x)})),
      synonyms: json['synonyms'],
      antonyms: json['antonyms'],
    );
  }

  Map<String, dynamic> toJson() => {
        'partOfSpeech': partOfSpeech,
        'definitions': definitions.map((x) => x.toJson()).toList(),
        'synonyms': synonyms,
        'antonyms': antonyms,
      };
}

class Definition {
  final String definition;
  final String example;
  final List<String> synonyms;
  final List<String> antonyms;

  Definition(
      {required this.definition,
      required this.example,
      required this.synonyms,
      required this.antonyms});

  factory Definition.fromJson(Map<String, dynamic> json) {
    return Definition(
        definition: json['definition'],
        example: json['example'],
        synonyms: json['synonyms'],
        antonyms: json['antonyms']);
  }

  Map<String, dynamic> toJson() => {
        'definition': definition,
        'example': example,
        'synonyms': synonyms,
        'antonyms': antonyms,
      };
}
