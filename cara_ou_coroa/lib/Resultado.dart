import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  final String valor;
  const Resultado({super.key, required this.valor});

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
  @override
  Widget build(BuildContext context) {
    var caminhoImagem;
    if(widget.valor == "cara") {
      caminhoImagem = "images/moeda_cara.png";
    }else{
      caminhoImagem = "images/moeda_coroa.png";
    }
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(caminhoImagem),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Image.asset("images/botao_voltar.png"),
            )
          ],
        ),
      ),
    );
  }
}
