class Video {
  String id;
  String titulo;
  String descricao;
  String imagem;
  String canal;

  Video({required this.id, required this.titulo, required this.descricao, required this.imagem, required this.canal});

  /*
  static converterJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videiId"],
      title: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["cannelId"],
    );
  }
  */

  //factory otimiza para menos uso de memória
  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json["id"]["videiId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["cannelTitle"],
      descricao: json["snippet"]["description"],
    );
  }
}