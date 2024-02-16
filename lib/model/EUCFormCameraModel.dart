class EUCForm {
  int id = 0;
  String scheme= '';
  String fy = '';
  String expenditure = '';
  String latitude = '';
  String longitude = '';
  String remark = '';




  EUCForm.empty();


  EUCForm({
    required this.id,
    required this.scheme,
    required this.fy,
    required this.expenditure,
    required this.latitude,
    required this.longitude,
    required this.remark,


  });

  factory EUCForm.fromMap(Map<String, dynamic> json) {
    return EUCForm(
      id: json['id'],
      scheme: json['scheme'],
      fy: json['FY'],
      expenditure: json['expenditure'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      remark: json['remark'],


    );
  }

  Map<String, dynamic> toMap() =>
      {
        'scheme': scheme,
        'FY': fy,
        'expenditure': expenditure,
        'latitude': latitude,
        'longitude': longitude,
        'remark': remark,
      };
}