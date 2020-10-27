import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  String titre;

  TopTitle(this.titre);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        child: Center(
          child: Text(
            titre,
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
