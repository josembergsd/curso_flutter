import 'package:atm_consultaoria/TelaClientes.dart';
import 'package:atm_consultaoria/TelaContato.dart';
import 'package:atm_consultaoria/TelaServicos.dart';
import 'package:flutter/material.dart';

import 'TelaEmpresa.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _abrirEmpresa(){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaEmpresa()),
      );
  }
  void _abrirServicos(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaServicos()),
    );
  }
  void _abrirClientes(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaClientes()),
    );
  }
  void _abrirContato(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaContato()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ATM Consultoria", style: TextStyle(fontSize: 22, color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.png"),
            Padding(
                padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _abrirEmpresa ,
                    child: Image.asset("images/menu_empresa.png"),
                  ),
                  GestureDetector(
                    onTap: _abrirServicos ,
                    child: Image.asset("images/menu_servico.png"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                GestureDetector(
                  onTap: _abrirContato ,
                  child: Image.asset("images/menu_cliente.png"),
                ),
                GestureDetector(
                  onTap: _abrirContato ,
                  child: Image.asset("images/menu_contato.png"),
                ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}