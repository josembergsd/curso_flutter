import 'package:flutter/material.dart';

import 'TelaSecundaria.dart';

void main() {
  runApp(MaterialApp(
    home: TelaPrincipal(),
  ));
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
                onPressed: (){
                  Navigator.push(
                      context,  //Já é definido no build
                      MaterialPageRoute(
                          builder: (context) => TelaSecundaria()
                      ),
                  );
                },
                child: Text("Ir para a segunda tela"),
            ),
          ],
        ),
      ),
    );
  }
}
