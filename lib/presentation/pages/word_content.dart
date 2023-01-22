import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/custom/custom_space_content.dart';

class WordContent extends StatelessWidget {
  const WordContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  'Park',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400),
                ),
                IconButton(
                  iconSize: 40,
                  onPressed: () async {
                    final player = AudioPlayer();
                    player.play(UrlSource(
                        'https://api.dictionaryapi.dev/media/pronunciations/en/park-us.mp3'));
                    player.pause();
                  },
                  icon: const Icon(Icons.volume_up, color: Colors.black),
                )
              ],
            ),
          ),
          const Text(
            '[paːk]',
            style: TextStyle(
                fontSize: 25,
                color: Colors.grey,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400),
          ),
          const CustomSpaceContent(),
          const Text(
              'A dense uncultivated tract of trees and undergrowth, larger than woods.',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400)),
          const CustomSpaceContent(),
          Center(
              child: CarouselSlider(
            options: CarouselOptions(
                height: 250.0,
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 600)),
            items: [
              "https://images.pexels.com/photos/1645840/pexels-photo-1645840.jpeg?auto=compress&cs=tinysrgb&h=350",
              "https://images.pexels.com/photos/158028/bellingrath-gardens-alabama-landscape-scenic-158028.jpeg?auto=compress&cs=tinysrgb&h=350",
              "https://images.pexels.com/photos/1770809/pexels-photo-1770809.jpeg?auto=compress&cs=tinysrgb&h=350"
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5),
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
                        i,
                        fit: BoxFit.cover,
                      ));
                },
              );
            }).toList(),
          )),
          const CustomSpaceContent(),
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
          const CustomSpaceContent(),
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
    );
  }
}
