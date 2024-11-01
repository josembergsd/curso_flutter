import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({super.key});

  @override
  State<EntradaCheckbox> createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {

  bool _comidaBrasileira = false;
  bool _comidaMexicana = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada CheckBox", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Column(
          children: [
            
            CheckboxListTile(
              title: Text("Comida brasileira"),
                subtitle: Text("A melhor comida do Mundo!"),
                //activeColor: Colors.red,
                //selected: true,
                //secondary: Icon(Icons.add_box),
                value: _comidaBrasileira,
                onChanged: (bool? valor) {
                  setState(() {
                    _comidaBrasileira = valor!;
                  });
                  //print("Checkbox: " + valor.toString());
                }),
            CheckboxListTile(
                title: Text("Comida mexicana"),
                subtitle: Text("A melhor comida do Mundo!"),
                //activeColor: Colors.red,
                //selected: true,
                //secondary: Icon(Icons.add_box),
                value: _comidaMexicana,
                onChanged: (bool? valor) {
                  setState(() {
                    _comidaMexicana = valor!;
                  });
                 // print("Checkbox: " + valor.toString());
                }),

            ElevatedButton(
                onPressed: (){
                  print(
                    "Comida Brasileira: " + _comidaBrasileira.toString() +
                    "\nComida Mexicana: " + _comidaMexicana.toString()
                  );
                },
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 20
                  )
                ),
            ),
            
            /*
            Text("Comida brasileira"),
            Checkbox(
                value: _estaSelecionado,
                onChanged: (bool? valor){
                  setState(() {
                    _estaSelecionado = valor!;
                  });
                  print("Checkbox: " + valor.toString());
                },
            ),
            */
            
          ],
        ),
      ),
    );
  }
}
