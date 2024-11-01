import 'package:flutter/material.dart';

class EntradaRaioButtom extends StatefulWidget {
  const EntradaRaioButtom({super.key});

  @override
  State<EntradaRaioButtom> createState() => _EntradaRadioButtomState();
}

class _EntradaRadioButtomState extends State<EntradaRaioButtom> {

  String _escolhaUsuario = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Entrada Radio Buttom", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: [
            RadioListTile(
              title: Text("Masculino"),
              value: "m",
              groupValue: _escolhaUsuario,
              onChanged: (String? escolha){
                setState(() {
                  _escolhaUsuario = escolha!;
                });
              }
            ),
            RadioListTile(
                title: Text("Feminino"),
                value: "f",
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha){
                  setState(() {
                    _escolhaUsuario = escolha!;
                  });
                }
            ),
            ElevatedButton(
                onPressed: (){
                  print("Resultado: " + _escolhaUsuario);
                },
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 20
                  ),
                )
            ),
            /*
            Text("Masculino"),
            Radio(
                value: "m",
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha){
                  setState(() {
                    _escolhaUsuario = escolha!;
                  });
                  print("Resultado: " + escolha!);
                }
            ),
            Text("Feminino"),
            Radio(
                value: "f",
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha){
                  setState(() {
                    _escolhaUsuario = escolha!;
                  });
                  print("Resultado: " + escolha!);
                }
            ),*/
          ],
        )
      ),
    );
  }
}
