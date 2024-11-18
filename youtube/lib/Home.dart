import 'package:flutter/material.dart';
import 'package:youtube/screens/Incription.dart';
import 'package:youtube/screens/Library.dart';
import 'package:youtube/screens/Start.dart';
import 'package:youtube/screens/Trending.dart';

import 'CustomSearchDelegate.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Start( _resultado ),
      Trending(),
      Inscription(),
      Library(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        title: Image.asset("images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
              onPressed: () async{
                String? res = await showSearch(context: context,delegate: CustomSearchDelegate());
                setState((){
                    _resultado = res!;
                  }
                );
                //print("resultado: digitado: ${res}");
              },
              icon: Icon(Icons.search)
          ),
          /*IconButton(
              onPressed: (){
                print("Button videoCam");
              },
              icon: Icon(Icons.videocam)
          ),
          IconButton(
              onPressed: (){
                print("Button videoCam");
              },
              icon: Icon(Icons.account_circle)
          ),*/
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        //type: BottomNavigationBarType.shifting,
        //fixedColor: Colors.red,
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
                label: "Início",
                icon: Icon(Icons.home),
                //backgroundColor: Colors.orange,
            ),
            BottomNavigationBarItem(
                label: "Em alta",
                icon: Icon(Icons.whatshot),
                //backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
                label: "Inscrições",
                icon: Icon(Icons.subscriptions),
                //backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
                label: "Biblioteca",
                icon: Icon(Icons.folder),
                //backgroundColor: Colors.green,
            ),
          ],
      ),
    );
  }
}
