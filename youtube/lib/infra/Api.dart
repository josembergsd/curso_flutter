import 'package:http/http.dart' as http;
import 'dart:convert';

var CHAVE_YOUTUBE_API = Uri.parse("AIzaSyB9SZ6CxsesgBzkruGoe34Gv3ApFc0-Gfc");
var ID_CANAL = Uri.parse("UCm_nEAH7DCfjmXUbNkN6JFw");
var URL_BASE = Uri.parse("https://www.googleapis.com/youtube/v3/");

class Api {
  pesquisar(String pesquisa) async {
      http.Response response = await http.get(
        URL_BASE.resolve("/search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa")
      );

      if( response.statusCode == 200) {
        //print("Respnose " + response.body);
        Map<String, dynamic> dadosJson = json.decode(response.body);
        print("Response ${dadosJson["items"]}");
      }else {

      }
  }
}