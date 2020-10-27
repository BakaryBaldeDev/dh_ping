import 'package:flutter/material.dart';
import 'package:projet_direct_hospital/components/navbar.dart';
import 'package:projet_direct_hospital/components/top_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projet_direct_hospital/pages/admission.dart';
import 'package:projet_direct_hospital/pages/home.dart';
import 'package:projet_direct_hospital/utilities/screensize_widget.dart';

class Connection extends StatefulWidget {
  static const String id = 'connection';
  @override
  _ConnectionState createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
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
                    TopTitle('Se connecter'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: TextField(
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
                          ),
                          Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: TextField(
                              obscureText: true,
                              onChanged: (value) {
                                password = value;
                              },
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Mot de passe',
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
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: MaterialButton(
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
                                  final user =
                                      await _auth.signInWithEmailAndPassword(
                                          email: email, password: password);
                                  if (user != null) {
                                    Navigator.pushNamed(context, Admission.id);
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                              child: Text(
                                'Connexion',
                                style: TextStyle(
                                  color: Color(0xFF05B4A5),
                                  fontSize: 30,
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
            ],
          ),
        ),
      ),
    );
  }
}
