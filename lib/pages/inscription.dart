import 'package:flutter/material.dart';
import 'package:projet_direct_hospital/components/navbar.dart';
import 'package:projet_direct_hospital/components/top_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_direct_hospital/pages/admission.dart';
import 'package:projet_direct_hospital/pages/home.dart';
import 'package:projet_direct_hospital/utilities/screensize_widget.dart';

class Inscription extends StatefulWidget {
  static const String id = 'inscription';
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  String dropdownValue = 'Hospitalier';
  final _auth = FirebaseAuth.instance;
  String nom;
  String prenom;
  String email;
  String password;
  int RPPS;
  int tel;
  String adresse;

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
        body: Container(
          decoration: kDecorationFond,
          child: Column(
            children: [
              Navbar(),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    TopTitle('Inscription'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      height: 600,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height: 15),
                          TextField(
                            onChanged: (value) {
                              nom = value;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Nom',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              prenom = value;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Prénom',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              email = value;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Mot de passe (minimum 6 caractères)',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              adresse = value;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Adresse',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              tel = value as int;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'Numéro de telephone',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              RPPS = value as int;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: 'RPPS',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Vous êtes :'),
                              DropdownButton<String>(
                                value: dropdownValue,
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style: TextStyle(color: Colors.blue),
                                underline: Container(
                                  height: 3,
                                  color: Colors.blue,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>[
                                  'Hospitalier',
                                  'Généraliste'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          MaterialButton(
                            highlightColor: Colors.blue,
                            hoverColor: Colors.white,
                            minWidth: 90,
                            height: 90,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                            onPressed: () async {
                              try {
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);
                                if (newUser != null) {
                                  Navigator.pushNamed(context, Admission.id);
                                }
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: Text(
                              'Valider',
                              style: TextStyle(
                                color: Color(0xFF05B4A5),
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ],
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
