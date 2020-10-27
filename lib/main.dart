import 'package:flutter/material.dart';
import 'package:projet_direct_hospital/pages/admission.dart';
import 'package:projet_direct_hospital/pages/connection.dart';
import 'package:projet_direct_hospital/pages/home.dart';
import 'package:projet_direct_hospital/pages/inscription.dart';
import 'package:projet_direct_hospital/pages/med_poly/med_poly.dart';
import 'package:projet_direct_hospital/pages/med_poly/medpoly_rouencn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Direct Hospital',
      theme: ThemeData(
        fontFamily: 'Barlow',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        Admission.id: (context) => Admission(),
        MedPolyvalente.id: (context) => MedPolyvalente(),
        MedPolyvalenteRouenCN.id: (context) => MedPolyvalenteRouenCN(),
        Inscription.id: (context) => Inscription(),
        Connection.id: (context) => Connection(),
      },
    );
  }
}
