
import 'package:flutter/material.dart';
import '../main.dart';
import '../widgets/cartAppBar.dart';
import '../widgets/cartBottom.dart';
import '../widgets/cartItems.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CartAppBar(),
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              // color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35)
              ),
            ),
            child: Column(children: [
              CartItems(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),


                ),
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Paleta.amarelo,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(Icons.add, color: Colors.white,),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Adicionar código de cupum",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],),
          )
        ],
      ),
      bottomNavigationBar: CartBottom(),
    );
  }
}
