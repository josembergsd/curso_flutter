import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {
  final String valor;
  const TelaSecundaria({super.key, required this.valor});

  @override
  State<TelaSecundaria> createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Secundaria"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Text("Segunda tela!"),
            ElevatedButton(
              child: Text("Ir para a primeira tela"),
              onPressed: (){
                //Navigator.pushNamed(context, "/");
                Navigator.pop(context, "/");
              },
            )
          ],
        ),
      ),
    );
  }
}
