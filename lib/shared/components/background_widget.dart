import 'package:flutter/material.dart';

Widget backgroundWidget() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.black,
          Colors.redAccent,
          Color.fromRGBO(255, 82, 82, 1),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [.1, .5, .7],
      ),
    ),
  );
}
