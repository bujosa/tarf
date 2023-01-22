import 'package:flutter/material.dart';

class CustomSpaceContent extends StatelessWidget {
  const CustomSpaceContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.02,
    );
  }
}
