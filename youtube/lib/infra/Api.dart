import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/Video.dart';

const chaveYoutubeApi = "AIzaSyB9SZ6CxsesgBzkruGoe34Gv3ApFc0-Gfc";
const idCanal = "UCm_nEAH7DCfjmXUbNkN6JFw";
const urlBase = "https://www.googleapis.com/youtube/v3/";

class Api {

  final client = http.Client();

  Future<List<Video>> pesquisar(String pesquisa) async {
    final String url = Uri.parse("${urlBase}search"
        "?part=snippet"
        "&type=video"
        "&maxResults=20"
        "&order=date"
        "&key=$chaveYoutubeApi"
        "&channelId=$idCanal"
        "&q=$pesquisa",
    ).toString();


    try {
      http.Response resp = await client.get(Uri.parse(url));

      if (resp.statusCode == 200) {
        final Map<String, dynamic> dadosJson = json.decode(resp.body);
        final List<Video> videos = (dadosJson["items"] as List)
            .map<Video>((map) => Video.fromJson(map))
            .toList();

        for (var video in videos) {
          print("resultado: ${video.titulo}");
        }
        return videos;
      } else {
        print("Erro ao buscar vídeos: ${resp.statusCode}");
        return [];
      }
    } catch (e) {
      print("Erro na requisição: $e");
      return [];
    }
  }
}