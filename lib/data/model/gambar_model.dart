class GambarCandi {
  String? namaGambar;
  String? pathGambarCandi;

  GambarCandi({this.namaGambar, this.pathGambarCandi});

  GambarCandi.fromJson(Map<String, dynamic> json) {
    namaGambar = json['namaGambar'];
    pathGambarCandi = json['pathGambarCandi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['namaGambar'] = namaGambar;
    data['pathGambarCandi'] = pathGambarCandi;
    return data;
  }
}