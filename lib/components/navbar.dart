import 'package:projet_direct_hospital/pages/connection.dart';
import 'package:projet_direct_hospital/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:projet_direct_hospital/pages/inscription.dart';
import 'package:projet_direct_hospital/utilities/screensize_widget.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth > 1200) {
        return DesktopNavbar();
      } else if (constrains.maxWidth > 900 && constrains.maxWidth < 1200) {
        return DesktopNavbar();
      } else {
        return Nada();
      }
    });
  }
}

class Nada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        //borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'images/logo.jpg',
            fit: BoxFit.fill,
            width: 120,
            height: 120,
          ),
          Row(
            children: [
              Center(
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Home.id);
                  },
                  child: Text(
                    'Direct Hospital',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 30),
              MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, Inscription.id);
                },
                child: Text(
                  'S\'inscrire',
                  style: kStyleLittleBlack,
                ),
              ),
              SizedBox(width: 30),
              MaterialButton(
                hoverColor: Colors.grey[800],
                color: Color(0xFF05B4A5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Connection.id);
                },
                child: Text(
                  'Connexion',
                  style: kStyleLittleWhite,
                ),
              ),
              SizedBox(width: 30),
              Text(
                'Contacts',
                style: kStyleLittleBlack,
              ),
              SizedBox(width: 30),
              Text(
                'Transports',
                style: kStyleLittleBlack,
              ),
              SizedBox(width: 30),
            ],
          ),
        ],
      ),
    );
  }
}
