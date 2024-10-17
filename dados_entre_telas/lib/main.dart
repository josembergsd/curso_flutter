import 'package:dados_entre_telas/TelaSecundaria.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String usuario = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Tela Principal",
          style: TextStyle(
              fontSize: 20,
              color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            TextField(
              onChanged: (valor) => usuario = valor,
            ),
            ElevatedButton(
                child: Text("Ir para segunda tela"),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaSecundaria(valor: usuario),
                      ),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
