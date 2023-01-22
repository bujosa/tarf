import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:rive/rive.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  icon: const Icon(Icons.home, color: Colors.white),
                  onPressed: () {},
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
                  icon: const Icon(Icons.copy, color: Colors.white),
                  onPressed: () {
                    const data = ClipboardData(text: 'Comida');

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
            ],
          )),
    );
  }
}
