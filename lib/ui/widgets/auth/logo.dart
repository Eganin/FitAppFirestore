import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget logo() {
  return Padding(
    padding: EdgeInsets.only(top: 100.0),
    child: Container(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'MaxFit',
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
