import 'dart:math';

import 'package:flutter/material.dart';

import 'Resultado.dart';

class Jogar extends StatefulWidget {
  const Jogar({super.key});

  @override
  State<Jogar> createState() => _JogarState();
}

class _JogarState extends State<Jogar> {

  void _exibirResultado(){
    
      var itens = ["cara", "coroa"];
      var numero = Random().nextInt(itens.length);
      var resultado = itens[numero];
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Resultado(valor: resultado,)
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("images/logo.png"),
              GestureDetector(
                onTap: _exibirResultado,
                child: Image.asset("images/botao_jogar.png"),
              )
            ],
          ),
      ),
    );
  }
}
