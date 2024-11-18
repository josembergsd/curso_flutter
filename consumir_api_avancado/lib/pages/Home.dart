import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'Post.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /*
  Future<Map> _recuperarPreco() async {
    var url = Uri.parse("https://blockchain.info/ticker");
    http.Response response = await http.get(url);

    return json.decode(response.body);
  }*/

  var _urlBase = Uri.parse("https://jsonplaceholder.typicode.com");

  Post post = Post(0, 1, "","");
  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(_urlBase.resolve("/posts"));
    if(response.statusCode == 200) {
      var dadosJson = json.decode(response.body);
      List<Post> postagens = [];
      for (var post in dadosJson) {
       // print("post: ${post["title"]}");
        Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
        postagens.add(p);
      }
      return postagens;
    } else {
      throw Exception("Falha ao carregar as postagens");
    }
  }

  _post() async {

    Post post = new Post(120, null, "Título", "Corpo da postagem");
    var corpo = json.encode(
      post.toJson()
    );

    http.Response response = await http.post(
        _urlBase.resolve("/posts"),
        headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpo,
    );

    print("response: ${response.statusCode}");
    print("response: ${response.body}");
  }

  _put() async {
    //Precisa mandar o objeto inteiro para poder alterar
    Post post = new Post(120, null, "Título", "Corpo da postagem");
    var corpo = json.encode(
        post.toJson()
    );
    http.Response response = await http.put(
      _urlBase.resolve("/posts/2"),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpo,
    );

    print("response: ${response.statusCode}");
    print("response: ${response.body}");
  }

  _patch() async {
    //Mandar somente os campos que se quer alterar
    Post post = new Post(120, null, "Título", "Corpo da postagem");
    var corpo = json.encode(
        post.toJson()
    );
    http.Response response = await http.patch(
      _urlBase.resolve("/posts/2"),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpo,
    );

    print("response: ${response.statusCode}");
    print("response: ${response.body}");
  }

  _delete() async {
    http.Response response = await http.delete(
        _urlBase.resolve("/posts/2")
    );

    if( response.statusCode == 200) {

    }
    print("response: ${response.statusCode}");
    print("response: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Consumo de serviço avançado'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: Text("Post"),
                  onPressed: _post,
                ),
                ElevatedButton(
                  child: Text("Put"),
                  onPressed: _put,
                ),
                ElevatedButton(
                  child: Text("Patch"),
                  onPressed: _patch,
                ),
                ElevatedButton(
                  child: Text("Delete"),
                  onPressed: _delete,
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: _recuperarPostagens(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none :
                    case ConnectionState.waiting :
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.active :
                    case ConnectionState.done :
                    //print("conexao done");
                      if( snapshot.hasError ) {
                        print("lista: Erro ao carregar");
                      } else {
                        print("Lista carregada!");
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index){
                            List<Post> lista = snapshot.data!;
                            Post post = lista[index];
                            return ListTile(
                              title: Text(post.title),
                              subtitle: Text(post.id.toString()),
                            );
                          },
                        );
                      }
                    return Center(child: Text("Estado desconhecido"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}