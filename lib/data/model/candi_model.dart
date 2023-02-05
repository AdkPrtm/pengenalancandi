import 'package:skripsi/data/model/model.dart';

class CandiModel {
  String? namaCandi;
  String? lokasiCandi;
  String? tahunCandi;
  String? riwayatCandi;
  String? agamaCandi;
  String? bahanCandi;
  String? tujuanCandi;
  String? geoCandi;
  List<GambarCandi>? gambarCandi;
  List<ReliefCandi>? reliefCandi;

  CandiModel(
      {this.namaCandi,
      this.lokasiCandi,
      this.tahunCandi,
      this.riwayatCandi,
      this.agamaCandi,
      this.bahanCandi,
      this.tujuanCandi,
      this.gambarCandi,
      this.geoCandi,
      this.reliefCandi});

  CandiModel.fromJson(Map<String, dynamic> json) {
    namaCandi = json['namaCandi'];
    lokasiCandi = json['lokasiCandi'];
    tahunCandi = json['tahunCandi'];
    riwayatCandi = json['riwayatCandi'];
    agamaCandi = json['agamaCandi'];
    bahanCandi = json['bahanCandi'];
    tujuanCandi = json['tujuanCandi'];
    geoCandi = json['geoCandi'];
    if (json['gambarCandi'] != null) {
      gambarCandi = <GambarCandi>[];
      json['gambarCandi'].forEach((v) {
        gambarCandi!.add(GambarCandi.fromJson(v));
      });
    }
    if (json['reliefCandi'] != null) {
      reliefCandi = <ReliefCandi>[];
      json['reliefCandi'].forEach((v) {
        reliefCandi!.add(ReliefCandi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['namaCandi'] = namaCandi;
    data['lokasiCandi'] = lokasiCandi;
    data['tahunCandi'] = tahunCandi;
    data['riwayatCandi'] = riwayatCandi;
    data['agamaCandi'] = agamaCandi;
    data['bahanCandi'] = bahanCandi;
    data['tujuanCandi'] = tujuanCandi;
    data['geoCandi'] = geoCandi;
    if (gambarCandi != null) {
      data['gambarCandi'] = gambarCandi!.map((v) => v.toJson()).toList();
    }
    if (reliefCandi != null) {
      data['reliefCandi'] = reliefCandi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
