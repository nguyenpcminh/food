import 'package:flutter/material.dart';

class RatingStart extends StatelessWidget {
  final int rating;
  RatingStart({this.rating});

  @override
  Widget build(BuildContext context) {
    String start = "";
    for (var i = 0; i < rating; i++) {
      start += "⭐ ";
      start.trim();
    }
    return Text(
      start,
      style: TextStyle(fontSize: 18.0),
    );
  }
}
