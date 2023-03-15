import 'package:flutter/material.dart';

class BackBtn extends StatefulWidget {
  const BackBtn({super.key});

  @override
  State<BackBtn> createState() => _BackBtnState();
}

class _BackBtnState extends State<BackBtn> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 30,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_outlined));
  }
}
