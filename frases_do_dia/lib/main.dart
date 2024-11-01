import 'dart:math';
import 'package:flutter/material.dart';


/*
Statless -> Wedgets que não podem ser alterados (constantes)
Stateful -> Widgets que podem ser alterados (variáveis)
 */

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful(),
  ));
}

class HomeStateful extends StatefulWidget {
  const HomeStateful({super.key});

  @override
  State<HomeStateful> createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  var _frases = [
    "Frase1",
    "Frase2",
    "Frase3",
    "Frase4",
    "Frase5",
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase(){
    var numeroRandom = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroRandom];
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do Dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(16),
            width: double.infinity, //Define o width com 100% do espaço disponível
            /*decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.amber)
            ),*/
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("images/logo.png"),
                Text(
                  _fraseGerada,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      color: Colors.black
                  ),
                ),
                ElevatedButton(
                  onPressed: _gerarFrase,
                  child: Text(
                    "Nova Frase",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Cor de fundo
                  ),
                )
              ],
            )
        ),
      )
    );
  }
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    var _titulo = "Instagram";

    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.green,
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Text("Conteúdo principal")
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.lightGreen,
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Text("Home"),
                  Text("Coleções")
                ],
              )
          )
      ),
    );
  }
}
