import 'package:flutter/material.dart';
import 'package:projet_direct_hospital/pages/home.dart';
import 'package:projet_direct_hospital/utilities/screensize_widget.dart';
import 'package:projet_direct_hospital/components/navbar.dart';
import 'package:projet_direct_hospital/components/top_title.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MedPolyvalente extends StatefulWidget {
  static const String id = 'medecine_polyvalente';
  @override
  _MedPolyvalenteState createState() => _MedPolyvalenteState();
}

class _MedPolyvalenteState extends State<MedPolyvalente> {
  final _auth = FirebaseAuth.instance;
  bool dispoCN = true;
  bool dispoPQ = false;
  bool dispoMI = true;
  int _index = 1;
  @override
  Widget build(BuildContext context) {
    switch (_index) {
      case 0:
        Navigator.pop(context);
        break;
      case 1:
        break;
      case 2:
        _auth.signOut();
        Navigator.pushNamed(context, Home.id);
        break;
    }
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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (int index) {
            setState(() {
              _index = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              title: Text('Retour'),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('Etape'),
              icon: Icon(
                Icons.looks_one,
                color: Colors.blue,
              ),
            ),
            BottomNavigationBarItem(
              title: Text('Deconnexion'),
              icon: Icon(
                Icons.exit_to_app_sharp,
                color: Colors.blue,
              ),
            ),
          ],
        ),
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
                    TopTitle('Médecine Polyvalente'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Column(
                          children: [
                            Text(
                              'CHU rouen'.toUpperCase(),
                              style: kStyleLittleBlack,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            ScreensizeWidget.isSmallScreen(context)
                                ? Column(
                                    children: [
                                      Container(
                                        //height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Service gériatrique Charles Nicoles',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            Container(
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: dispoCN
                                                          ? Colors.green
                                                              .withOpacity(0.9)
                                                          : Colors.red
                                                              .withOpacity(0.9),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                  shape: BoxShape.circle,
                                                  color: dispoCN
                                                      ? Colors.green.shade600
                                                      : Colors.red.shade600),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            dispoCN
                                                ? Text(
                                                    'ADMISSION POSSIBLE \n Vous pouvez continuer.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.green.shade600,
                                                    ),
                                                  )
                                                : Text(
                                                    'ADMISSION IMPOSSIBLE \n Consultez un autre hôpital.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.red.shade600,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Container(
                                        //height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Service gériatrique Petit Quevilly',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            Container(
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: dispoPQ
                                                          ? Colors.green
                                                              .withOpacity(0.9)
                                                          : Colors.red
                                                              .withOpacity(0.9),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                  shape: BoxShape.circle,
                                                  color: dispoPQ
                                                      ? Colors.green.shade600
                                                      : Colors.red.shade600),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            dispoPQ
                                                ? Text(
                                                    'ADMISSION POSSIBLE \n Vous pouvez continuer.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.green.shade600,
                                                    ),
                                                  )
                                                : Text(
                                                    'ADMISSION IMPOSSIBLE \n Consultez un autre hôpital.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.red.shade600,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Container(
                                        //height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Médecine Interne',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            Container(
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: dispoMI
                                                          ? Colors.green
                                                              .withOpacity(0.9)
                                                          : Colors.red
                                                              .withOpacity(0.9),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                  shape: BoxShape.circle,
                                                  color: dispoMI
                                                      ? Colors.green.shade600
                                                      : Colors.red.shade600),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            dispoMI
                                                ? Text(
                                                    'ADMISSION POSSIBLE \n Vous pouvez continuer.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.green.shade600,
                                                    ),
                                                  )
                                                : Text(
                                                    'ADMISSION IMPOSSIBLE \n Consultez un autre hôpital.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.red.shade600,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        //height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Service gériatrique Charles Nicoles',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            Container(
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: dispoCN
                                                          ? Colors.green
                                                              .withOpacity(0.9)
                                                          : Colors.red
                                                              .withOpacity(0.9),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                  shape: BoxShape.circle,
                                                  color: dispoCN
                                                      ? Colors.green.shade600
                                                      : Colors.red.shade600),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            dispoCN
                                                ? Text(
                                                    'ADMISSION POSSIBLE \n Vous pouvez continuer.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.green.shade600,
                                                    ),
                                                  )
                                                : Text(
                                                    'ADMISSION IMPOSSIBLE \n Consultez un autre hôpital.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.red.shade600,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        //height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Service gériatrique Petit Quevilly',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            Container(
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: dispoPQ
                                                          ? Colors.green
                                                              .withOpacity(0.9)
                                                          : Colors.red
                                                              .withOpacity(0.9),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                  shape: BoxShape.circle,
                                                  color: dispoPQ
                                                      ? Colors.green.shade600
                                                      : Colors.red.shade600),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            dispoPQ
                                                ? Text(
                                                    'ADMISSION POSSIBLE \n Vous pouvez continuer.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.green.shade600,
                                                    ),
                                                  )
                                                : Text(
                                                    'ADMISSION IMPOSSIBLE \n Consultez un autre hôpital.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.red.shade600,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        //height: 200,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(30))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Médecine Interne',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            Container(
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: dispoMI
                                                          ? Colors.green
                                                              .withOpacity(0.9)
                                                          : Colors.red
                                                              .withOpacity(0.9),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                  shape: BoxShape.circle,
                                                  color: dispoMI
                                                      ? Colors.green.shade600
                                                      : Colors.red.shade600),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                            ),
                                            dispoMI
                                                ? Text(
                                                    'ADMISSION POSSIBLE \n Vous pouvez continuer.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.green.shade600,
                                                    ),
                                                  )
                                                : Text(
                                                    'ADMISSION IMPOSSIBLE \n Consultez un autre hôpital.',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Colors.red.shade600,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Column(
                          children: [
                            Text(
                              'CH Yvetot'.toUpperCase(),
                              style: kStyleLittleBlack,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            ScreensizeWidget.isSmallScreen(context)
                                ? Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          //height: 200,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Médecine Polyvalente',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                              ),
                                              Container(
                                                height: 70,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: dispoCN
                                                            ? Colors.green
                                                                .withOpacity(
                                                                    0.9)
                                                            : Colors.red
                                                                .withOpacity(
                                                                    0.9),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                    shape: BoxShape.circle,
                                                    color: dispoCN
                                                        ? Colors.green.shade600
                                                        : Colors.red.shade600),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                              ),
                                              dispoCN
                                                  ? Text(
                                                      'ADMISSION POSSIBLE \n Vous pouvez continuer.',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors
                                                            .green.shade600,
                                                      ),
                                                    )
                                                  : Text(
                                                      'ADMISSION IMPOSSIBLE \n Consultez un autre hôpital.',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.red.shade600,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          //height: 200,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0,
                                                      3), // changes position of shadow
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Médecine Polyvalente',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                              ),
                                              Container(
                                                height: 70,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: dispoCN
                                                            ? Colors.green
                                                                .withOpacity(
                                                                    0.9)
                                                            : Colors.red
                                                                .withOpacity(
                                                                    0.9),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                    shape: BoxShape.circle,
                                                    color: dispoCN
                                                        ? Colors.green.shade600
                                                        : Colors.red.shade600),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                              ),
                                              dispoCN
                                                  ? Text(
                                                      'ADMISSION POSSIBLE \n Vous pouvez continuer.',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors
                                                            .green.shade600,
                                                      ),
                                                    )
                                                  : Text(
                                                      'ADMISSION IMPOSSIBLE \n Consultez un autre hôpital.',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.red.shade600,
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
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
