class Video {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video({
    this.id = "",
    this.titulo = "",
    this.descricao = "",
    this.imagem = "",
    this.canal = "",
  });

  //factory otimiza para menos uso de memória
  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelTitle"],
      descricao: json["snippet"]["description"],
    );
  }

}