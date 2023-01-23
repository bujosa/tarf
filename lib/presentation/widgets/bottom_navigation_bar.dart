import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:rive/rive.dart';
import 'package:tarf/providers/word_provider.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    WordProvider wordProvider = Provider.of<WordProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
      child: Container(
          padding: const EdgeInsets.only(top: 3, bottom: 8),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(
              color: Color(0xFF17203A),
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 36,
                height: 36,
                child: IconButton(
                  icon: const Icon(Icons.copy, color: Colors.white),
                  onPressed: () {
                    final data = ClipboardData(
                        text: wordProvider.dictionary.getSource());

                    Clipboard.setData(data);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text(
                        'Reference copied!',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400),
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.green,
                      duration: const Duration(seconds: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ));
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Timer? timer = Timer(const Duration(milliseconds: 600), () {
                    Navigator.of(context, rootNavigator: true).pop();
                  });

                  showDialog(
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (_) => const Dialog(
                            backgroundColor: Colors.transparent,
                            child: SizedBox(
                                width: 200,
                                height: 200,
                                child: RiveAnimation.asset(
                                  'assets/rive/animated_emojis.riv',
                                  artboard: "love",
                                  fit: BoxFit.cover,
                                )),
                          )).then((value) {
                    timer?.cancel();
                    timer = null;
                  });
                },
                child: const SizedBox(
                  width: 36,
                  height: 45,
                  child: RiveAnimation.asset(
                    'assets/rive/animated_emojis.riv',
                    artboard: "love",
                  ),
                ),
              ),
              SizedBox(
                width: 36,
                height: 36,
                child: IconButton(
                  icon: const Icon(Icons.info_outline,
                      color: Colors.white, size: 27),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('About',
                                style: TextStyle(color: Colors.white)),
                            backgroundColor: const Color(0xFF17203A),
                            content: const Text(
                                'This is a word of the day app made using a free APIs from dictionaryapi.dev',
                                style: TextStyle(color: Colors.white)),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              )
                            ],
                          );
                        });
                  },
                ),
              ),
            ],
          )),
    );
  }
}
