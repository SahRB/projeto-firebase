
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../main.dart';

class HomeAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
         InkWell(
            onTap: () {
              Navigator.pushNamed(context,"profile");
            },
            child: Icon(Icons.menu,
              size:30,
              color: Paleta.verdeEscuro,
            ),
          ),

          Padding(padding: EdgeInsets.only(left:20),
            child: Text("Export Art",

            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Paleta.preto),
            ),
          ),
         Spacer(

         ),

      Padding(
        padding: EdgeInsets.only(right: 20),),
          Icon( Icons.translate_outlined, size: 25, color: Paleta.preto, ),
          Badge(
            backgroundColor: Paleta.vermelho,
            label: Text("1", style: TextStyle(color: Colors.white),) ,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context,"cartPage");
              },
              child: Icon(Icons.shopping_bag_outlined, size: 30,   color: Paleta.preto,),
            ),
          )

        ],
      ),
    );
  }
}
