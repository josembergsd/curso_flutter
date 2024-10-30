import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/Video.dart';

const chaveYoutubeApi = "AIzaSyB9SZ6CxsesgBzkruGoe34Gv3ApFc0-Gfc";
const idCanal = "UCm_nEAH7DCfjmXUbNkN6JFw";
const urlBase = "https://www.googleapis.com/youtube/v3";

class Api {

  final client = http.Client();

  Future<List<Video>> pesquisar(String pesquisa) async {

    String url = "$urlBase"
        "/search"
        "?part=snippet"
        "&type=video"
        "&maxResults=20"
        "&order=date"
        "&key=$chaveYoutubeApi"
        "&channelId=$idCanal"
        "&q=$pesquisa";

        http.Response resp = await client.get(Uri.parse(url));

      if( resp.statusCode == 200) {
        Map<String, dynamic> dadosJson = json.decode(resp.body);
        List<Video> videos = List<Video>.from(
          dadosJson["items"].map<Video>(
              (map) {
                return Video.fromJson(map);
              }
          )
        );
        return videos;
      }else {

      }
    return pesquisar(pesquisa);
  }
}