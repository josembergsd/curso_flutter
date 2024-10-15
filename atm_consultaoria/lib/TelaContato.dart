import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  const TelaContato({super.key});

  @override
  State<TelaContato> createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Contatos", style: TextStyle(fontSize: 22, color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("images/detalhe_contato.png"),
                    Text("Contatos",),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("atendimento@atmconsultoria.com.br"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("Telefone: (86) 99920-8114"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("Celular: (86) 9838-3641"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
