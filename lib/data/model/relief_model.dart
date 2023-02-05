class ReliefCandi {
  String? namaRelief;
  String? pathReliefCandi;

  ReliefCandi({this.namaRelief, this.pathReliefCandi});

  ReliefCandi.fromJson(Map<String, dynamic> json) {
    namaRelief = json['namaRelief'];
    pathReliefCandi = json['pathReliefCandi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['namaRelief'] = namaRelief;
    data['pathReliefCandi'] = pathReliefCandi;
    return data;
  }
}