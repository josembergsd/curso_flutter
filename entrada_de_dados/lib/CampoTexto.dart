import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada Campo Texto", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: TextField(
                keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Digite um valor"
              ),
              //enabled: true,
              //maxLength: 2,
              //maxLengthEnforcement: true,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.green,
              ),
              //obscureText: true, //true é usado para campos de senha
              /*onChanged: (String texto){ //Chamado quando muda o valor
                  print("valor digitado: " + texto);
              },*/
              onSubmitted: (String texto){ //Chamado quando confirmado
                print("valor digitado: " + texto);
              },
              controller: _textEditingController ,
            ),
          ),
          ElevatedButton(
              onPressed: (){
                print("valor digitado: " + _textEditingController.text);
              },
              child: Text("Salvar"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
              ),
          )
        ],
      ),
    );
  }
}
