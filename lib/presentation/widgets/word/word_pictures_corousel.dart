import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarf/providers/word_provider.dart';

class WordPicturesCorousel extends StatefulWidget {
  const WordPicturesCorousel({Key? key}) : super(key: key);

  @override
  State<WordPicturesCorousel> createState() => _WordPicturesCorouselState();
}

class _WordPicturesCorouselState extends State<WordPicturesCorousel> {
  @override
  Widget build(BuildContext context) {
    final wordProvider = Provider.of<WordProvider>(context);

    return CarouselSlider(
      options: CarouselOptions(
          height: 250.0,
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 600)),
      items: wordProvider.pictures.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
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
    );
  }
}
