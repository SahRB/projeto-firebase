
import 'package:flutter/material.dart';
import '../main.dart';

class ProfileAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row (children: [
        InkWell(
          onTap:() {
            Navigator.pop(context, "home");
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Paleta.verdeEscuro,
          ),

        ),
        Padding(padding: EdgeInsets.only(left: 20),
          child: Text(
            "Perfil",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Paleta.verdeEscuro,
            ),
          ),
        ),
      ],),
    );
  }
}
