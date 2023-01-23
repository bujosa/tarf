import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarf/providers/word_provider.dart';

import '../widgets/custom/custom_space_content.dart';
import '../widgets/word/word_pictures_corousel.dart';
import '../widgets/word/word_title.dart';

class WordContent extends StatefulWidget {
  const WordContent({
    Key? key,
  }) : super(key: key);

  @override
  State<WordContent> createState() => _WordContentState();
}

class _WordContentState extends State<WordContent> {
  @override
  Widget build(BuildContext context) {
    final wordProvider = Provider.of<WordProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        children: <Widget>[
          const WordTitle(),
          wordProvider.dictionary.phonetic.isNotEmpty
              ? Text(
                  wordProvider.dictionary.phonetic,
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.grey,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400),
                )
              : Container(),
          const CustomSpaceContent(),
          Text(wordProvider.dictionary.getDefinition(),
              style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400)),
          const CustomSpaceContent(),
          wordProvider.pictures.isNotEmpty
              ? const Center(child: WordPicturesCorousel())
              : Container(),
          wordProvider.pictures.isNotEmpty
              ? const CustomSpaceContent()
              : Container(),
          Text.rich(
            TextSpan(
              text: 'Synonyms: ',
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                    text: wordProvider.dictionary.getSynonyms(),
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          const CustomSpaceContent(),
          wordProvider.dictionary.antonyms.isNotEmpty
              ? Text.rich(
                  TextSpan(
                    text: 'Antonyms: ',
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: wordProvider.dictionary.antonyms,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
