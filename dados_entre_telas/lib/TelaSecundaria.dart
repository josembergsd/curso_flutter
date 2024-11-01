import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {

  final String valor;
  const TelaSecundaria({
    super.key,
    required this.valor
  });

  @override
  State<TelaSecundaria> createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {

  late String valor;

  @override
  void initState() {
    super.initState();
    valor = widget.valor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Tela Secundária",
          style: TextStyle(
              fontSize: 20,
              color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
              Text("Segunda tela! valor passado: ${widget.valor}"),
          ],
        ),
      ),
    );
  }
}
