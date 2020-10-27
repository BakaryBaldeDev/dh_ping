import 'package:flutter/material.dart';
import 'package:projet_direct_hospital/components/navbar.dart';
import 'package:projet_direct_hospital/pages/home.dart';
import 'package:projet_direct_hospital/utilities/screensize_widget.dart';
import 'package:projet_direct_hospital/components/top_title.dart';
import 'med_poly/med_poly.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class Admission extends StatefulWidget {
  static const String id = 'admission';
  @override
  _AdmissionState createState() => _AdmissionState();
}

class _AdmissionState extends State<Admission> {
  final _auth = FirebaseAuth.instance;

  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ScreensizeWidget.isSmallScreen(context)
            ? AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Home.id);
                    },
                    child: Image.asset(
                      'images/logo.jpg',
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                  ),
                ],
                title: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Home.id);
                  },
                  child: Text(
                    'Direct Hospital',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : null,
        drawer: ScreensizeWidget.isSmallScreen(context) ? MyDrawer() : null,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _auth.signOut();
              Navigator.pushNamed(context, Home.id);
            });
          },
          child: Icon(
            Icons.exit_to_app_sharp,
            color: Colors.white,
          ),
        ),
        body: Container(
          decoration: kDecorationFond,
          child: Column(
            children: [
              Navbar(),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    TopTitle('Admission'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: Text(
                                'Une admission simple en 3 étapes :',
                                textAlign: TextAlign.center,
                                style: kStyleLittleBlack,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.looks_one),
                                  Text(
                                    'Identification des lits disponibles en proximité',
                                    textAlign: TextAlign.center,
                                    style: kStyleLittleBlack,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.looks_two),
                                  Text(
                                    'Remplissage de la demande d’admission',
                                    textAlign: TextAlign.center,
                                    style: kStyleLittleBlack,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.looks_3),
                                  Text(
                                    'Organisation du transport sanitaire',
                                    textAlign: TextAlign.center,
                                    style: kStyleLittleBlack,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: FlatButton(
                            textColor: Colors.white,
                            color: Colors.blue[200],
                            child: Text(
                              'Médecine Polyvalente',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, MedPolyvalente.id);
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: FlatButton(
                            textColor: Colors.white,
                            color: Colors.blue[300],
                            child: Text(
                              'Médecine Gériatrique',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: FlatButton(
                            textColor: Colors.white,
                            color: Colors.blue[400],
                            child: Text(
                              'Cardiologie',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: FlatButton(
                            textColor: Colors.white,
                            color: Colors.blue[500],
                            child: Text(
                              'Pneumologie',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: FlatButton(
                            textColor: Colors.white,
                            color: Colors.blue[600],
                            child: Text(
                              'Nutrition',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: FlatButton(
                            textColor: Colors.white,
                            color: Colors.blue[700],
                            child: Text(
                              'SSR',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
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
