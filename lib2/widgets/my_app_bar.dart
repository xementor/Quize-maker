import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar MyAppBar() {
  return AppBar(
    backgroundColor: Colors.blueGrey,
    actionsIconTheme: const IconThemeData(
      color: Colors.red,
      opacity: 10,
      size: 30,
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 20),
        child: GestureDetector(
          child: Icon(Icons.search),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 20),
        child: GestureDetector(
          child: Icon(Icons.sort),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 20),
        child: GestureDetector(
          child: Icon(Icons.more_vert),
        ),
      ),
    ],
    leading: GestureDetector(
      child: Icon(
        Icons.menu,
      ),
      onTap: () {},
    ),
    title: Text("PKM"),
  );
}
