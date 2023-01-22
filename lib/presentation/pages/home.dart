import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../widgets/app_bar.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          addAutomaticKeepAlives: true,
          primary: true,
          dragStartBehavior: DragStartBehavior.start,
          children: <Widget>[
            Container(
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
                children: [
                  const Text(
                    'Battle',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400),
                  ),
                  IconButton(
                    iconSize: 50,
                    onPressed: () async {
                      final player = AudioPlayer();
                      player.play(UrlSource(
                          'https://api.dictionaryapi.dev/media/pronunciations/en/battle-us.mp3'));
                      player.pause();
                    },
                    icon: const Icon(Icons.volume_up, color: Colors.black),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.3,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Image.network(
                  'https://images.pexels.com/photos/339805/pexels-photo-339805.jpeg?auto=compress&cs=tinysrgb&h=350',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Text.rich(
              TextSpan(
                text: 'Meaning: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text:
                          'A war or fight between two or more groups of people',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Text.rich(
              TextSpan(
                text: 'Synonyms: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Fight, Struggle, Conflict',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Text.rich(
              TextSpan(
                text: 'Antonyms: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Peace, Harmony, Tranquility',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
