
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../main.dart';
import '../widgets/itemAppBar.dart';
import '../widgets/itemBottom.dart';
class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFEAECE8),
      body: ListView(

        children: [

          ItemAppBar(),
          Padding(padding: EdgeInsets.all(16),

            child: Image.asset("images/2.jpg",height: 300,),
          ),
          Arc(
            edge: Edge.TOP,
            arcType: ArcType.CONVEY,
            height: 30,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(
                      top: 50,
                      bottom: 20,
                    ),
                      child: Row(
                        children: [
                          Text("Titulo do produto", style: TextStyle(fontSize: 28, color: Paleta.verdeEscuro, fontWeight: FontWeight.bold),),
                          
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 5, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        RatingBar.builder(
                        initialRating: 4,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4),
                        itemBuilder: (context, _)=> Icon(
                            Icons.star, color: Paleta.amarelo),
                        onRatingUpdate: (index){},
                      ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: Offset(0,3),
                              ),
                            ],
                          ),
                          child: Icon(CupertinoIcons.minus, size: 18,),

                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("01", style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,

                          ),),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: Offset(0,3),
                              ),
                            ],
                          ),
                          child: Icon(CupertinoIcons.plus, size: 18,),

                        )
                      ],
                    )
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text("Escrever uma descição detalhada do produto",
                        style: TextStyle(
                          fontSize: 17,
                          color: Paleta.preto,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 12),
                      child:

                      Text("Comentários",
                        style: TextStyle(
                          fontSize: 17,
                          color: Paleta.verdeEscuro,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),

          )
        ],
      ),
      bottomNavigationBar: ItemBottom(),
    );
  }
}
