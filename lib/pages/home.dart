import 'package:flutter/material.dart';
import 'package:projet_direct_hospital/pages/admission.dart';
import 'package:projet_direct_hospital/utilities/screensize_widget.dart';
import 'package:projet_direct_hospital/components/navbar.dart';

class Home extends StatefulWidget {
  static const String id = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Accueil(),
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

class Accueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //color: Colors.transparent,
        ),
        child: ScreensizeWidget.isSmallScreen(context)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/medecin5.jpg'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Text(
                      'Une réponse immédiate à toutes vos demandes',
                      textAlign: TextAlign.center,
                      style: kStyleLittleWhite,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/medecin6.jpg'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Text(
                      'Permet de faciliter l’organisation, la communication et la coordination des admissions directes en service hospitalier',
                      textAlign: TextAlign.center,
                      style: kStyleLittleWhite,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/medecin7.jpg'),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Text(
                      'Une solution simple et efficace à destination des professionnels',
                      textAlign: TextAlign.center,
                      style: kStyleLittleWhite,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/medecin5.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 300,
                        child: Text(
                          'Une réponse immédiate à toutes vos demandes',
                          textAlign: TextAlign.center,
                          style: kStyleLittleWhite,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/medecin6.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 300,
                        child: Text(
                          'Permet de faciliter l’organisation, la communication et la coordination des admissions directes en service hospitalier',
                          textAlign: TextAlign.center,
                          style: kStyleLittleWhite,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/medecin7.jpg'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 300,
                        child: Text(
                          'Une solution simple et efficace à destination des professionnels',
                          textAlign: TextAlign.center,
                          style: kStyleLittleWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
