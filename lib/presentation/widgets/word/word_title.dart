import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarf/providers/word_provider.dart';

class WordTitle extends StatefulWidget {
  const WordTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<WordTitle> createState() => _WordTitleState();
}

class _WordTitleState extends State<WordTitle> {
  @override
  Widget build(BuildContext context) {
    final wordProvider = Provider.of<WordProvider>(context);

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          Text(
            wordProvider.word,
            style: const TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontFamily: 'Montserrat',
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w400),
          ),
          wordProvider.dictionary.audio.isNotEmpty
              ? IconButton(
                  iconSize: 40,
                  onPressed: () async {
                    final player = AudioPlayer();
                    player.play(UrlSource(wordProvider.dictionary.audio));
                    player.pause();
                  },
                  icon: const Icon(Icons.volume_up, color: Colors.black),
                )
              : Container(),
        ],
      ),
    );
  }
}
