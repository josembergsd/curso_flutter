import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({super.key});

  @override
  State<EntradaSwitch> createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {

  bool _escolhaUsuario = false;
  bool _escolhaConfiguracao = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada Switch", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          /*
          Switch(
              value: false,
              onChanged: (bool valor){
                  setState(() {
                    _escolhaUsuario = valor;
                  });
              }
          ),
          */
          SwitchListTile(
              title: Text("Receber notificaçoes?"),
              value: _escolhaUsuario,
              onChanged: (bool valor){
                setState(() {
                  _escolhaUsuario = valor;
                });
              }
          ),
          /*
          SwitchListTile(
              title: Text("Carregar imagens automaticamente"),
              value: _escolhaConfiguracao,
              onChanged: (bool valor){
                setState(() {
                  _escolhaConfiguracao = valor;
                });
              }
          ),
          */
          ElevatedButton(
              onPressed: (){
                if(_escolhaUsuario) {
                  print("escolha: ativar notificações");
                } else {
                  print("escolha: NÃO ativar notificações");
                }
              },
              child: Text(
                "Salvar",
                style: TextStyle(
                    fontSize: 20
                ),
              )
          ),
        ],
      ),
    );
  }
}
