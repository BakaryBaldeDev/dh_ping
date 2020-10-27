import 'package:flutter/material.dart';
import 'package:projet_direct_hospital/utilities/screensize_widget.dart';
import 'package:projet_direct_hospital/components/navbar.dart';
import 'package:projet_direct_hospital/components/top_title.dart';

class MedPolyvalenteRouenCN extends StatefulWidget {
  static const String id = 'medecine_polyvalente_rouen_cn';
  @override
  _MedPolyvalenteRouenCNState createState() => _MedPolyvalenteRouenCNState();
}

class _MedPolyvalenteRouenCNState extends State<MedPolyvalenteRouenCN> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF00F260), Color(0xFF0575E6), Colors.white],
          )),
          child: Column(
            children: [
              Navbar(),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    TopTitle('Médecine Polyvalente \n Rouen Charles Nicoles'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                        //child: Column(),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
