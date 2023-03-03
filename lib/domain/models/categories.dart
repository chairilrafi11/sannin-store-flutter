class Categories {
  String? nama;
  String? kode;
  String? status;

  Categories({this.nama, this.kode, this.status});

  Categories.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    kode = json['kode'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['kode'] = kode;
    data['status'] = status;
    return data;
  }
}
