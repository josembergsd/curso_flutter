import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCep = TextEditingController();
  String _resultado = "Seu cep aparecerá aqui";

  _recuperarCep() async {

    String cepDigitado = _controllerCep.text;
    var url = Uri.parse("https://viacep.com.br/ws/${cepDigitado}/json/");
    http.Response response;

    response = await http.get(url as Uri);
    Map<String, dynamic> retorno = json.decode( response.body );
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    setState((){
      _resultado = "${logradouro}, ${complemento}, ${bairro}";
    });

    // print(
    //     "Resposta logradouro: ${logradouro} complemento: ${complemento} bairro: ${bairro} "
    // );

    //print("resposta: " + response.statusCode.toString() );
    //print("resposta: " + response.body );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviços Web"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Digite um cep: Ex: 64034380",
              ),
              controller: _controllerCep,
            ),
            ElevatedButton(
                onPressed: _recuperarCep,
                child: Text("Buscar CEP"),
            ),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
