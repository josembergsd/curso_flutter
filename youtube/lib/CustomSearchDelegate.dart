import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
              query = "";
          },
          icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(
        onPressed: (){
          close(context, "");
        },
        icon: Icon(Icons.arrow_back),
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //print("resultado: digitado " + query);
    /*
    List<String> lista = [];
    if(query.isNotEmpty){
      lista = [
        "Android", "Android navegação", "IOS", "Jogos"
      ].where(
          (texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();

      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){
                close(context, lista[index]);
              },
              title: Text( lista[index]),
            );
          }
      );
    } else {
      return Center(
        child: Text("Nenhum resultado para pesquisa"),
      );
    }
*/
    return Container();
  }

}