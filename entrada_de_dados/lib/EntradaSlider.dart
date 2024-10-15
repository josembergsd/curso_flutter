import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({super.key});

  @override
  State<EntradaSlider> createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {

  String _valorSelecionado = "";
  double _valor = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada Slider", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          children: [
            Slider(
                value: _valor,
                min: 0,
                max: 10,
                label: _valor.toString(),
                divisions: 10,
                onChanged: (double valor){
                  setState(() {
                    _valor = valor;
                  });
                }
            ),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: (){
                  setState(() {
                    _valorSelecionado = "Valor selecionado: " + _valor.toString();
                  });
                  print("Valor selecionado: " + _valor.toString());
                },
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )
            ),
            Text(_valorSelecionado),
          ],
        ),
      )
    );
  }
}
