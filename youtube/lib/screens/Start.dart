import 'package:flutter/material.dart';

import '../infra/Api.dart';
import '../model/Video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'VideoPlayerScreen.dart';

class Start extends StatefulWidget {

  final String resultado;
  const Start(this.resultado, {super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {

  _listarVideos(String pesquisa) {
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
        future: _listarVideos(widget.resultado),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if(snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      List<Video> videos = snapshot.data!;
                      Video video = videos[index];
                      return GestureDetector(
                        onTap: (){
                          //Navegar para a tela do vídeo
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoPlayerScreen(videoId: video.id),
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(video.imagem)
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(video.titulo),
                              subtitle: Text(video.canal),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      height: 2,
                      color: Colors.grey,
                    ),
                    itemCount: snapshot.data!.length,
                );
              }else {
                return Text("Nenhum dado a ser exibido");
              }
          }

        }
    );
  }
}
