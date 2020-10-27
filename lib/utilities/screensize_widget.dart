import 'package:flutter/material.dart';
import 'package:projet_direct_hospital/pages/connection.dart';
import 'package:projet_direct_hospital/pages/home.dart';
import 'package:projet_direct_hospital/pages/inscription.dart';

class ScreensizeWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ScreensizeWidget(
      {Key key,
      @required this.largeScreen,
      this.mediumScreen,
      this.smallScreen})
      : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 900;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 900 &&
        MediaQuery.of(context).size.width <= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 900) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: kDecorationFondDrawer,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 160,
                  width: 160,
                  child: Image.asset(
                    'images/logo.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Inscription.id);
                        },
                        child: Text(
                          'S\'inscrire',
                          style: kStyleLittleBlack,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Connection.id);
                        },
                        child: Text(
                          'Connexion',
                          style: kStyleLittleBlack,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Inscription.id);
                        },
                        child: Text(
                          'Contacts',
                          style: kStyleLittleBlack,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13.0),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Inscription.id);
                        },
                        child: Text(
                          'Transports',
                          style: kStyleLittleBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

const kDecorationFond = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF00F260), Color(0xFF0575E6), Colors.white70],
  ),
);

const kDecorationFondDrawer = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [Color(0xFF00F260), Colors.white70],
  ),
);

const kStyleLittleWhite = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
const kStyleLittleBlack = TextStyle(
  color: Colors.black87,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
