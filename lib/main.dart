import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exportacao_de_artesanato/pages/addProduto.dart';
import 'package:exportacao_de_artesanato/pages/cartPage.dart';
import 'package:exportacao_de_artesanato/pages/editarProduto.dart';
import 'package:exportacao_de_artesanato/pages/home.dart';
import 'package:exportacao_de_artesanato/pages/itemPage.dart';
import 'package:exportacao_de_artesanato/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'pages/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(MyApp());

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  await firestore.collection("Só para testar").doc("Estou testando").set({"funcionou": true});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: "/",  // Defina a rota inicial aqui, que deve ser "/"

      // Remova a propriedade home se você estiver utilizando o initialRoute
      // home: Login(),

      routes: {
        "/": (context) => Login(),
        "home":(context)=>Home(),
        "cartPage": (context) => CartPage(),
        "itemPage": (context)=> ItemPage(),
        "profile": (context)=> Profile(),
        "addProduto": (context)=> AddProduto(),
        "editarProduto":(context)=> EditarExcluirProduto(),
      },
    );
  }
}

class Paleta {
  static const preto = Color(0xFF040303);
  static const amarelo = Color(0xFFDC851F);
  static const vermelho = Color(0xFF941B0C);
  static const verdeEscuro = Color(0xFF47682C);
}
