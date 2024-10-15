import 'package:flutter/material.dart';

class TelaClientes extends StatefulWidget {
  const TelaClientes({super.key});

  @override
  State<TelaClientes> createState() => _TelaClientesState();
}

class _TelaClientesState extends State<TelaClientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Clientes", style: TextStyle(fontSize: 22, color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(50),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("images/detalhe_cliente.png"),
                    Text("Clientes", style: TextStyle(fontSize: 18, color: Colors.deepOrange),)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
