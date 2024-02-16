class SearchSanctionModel {
  String? status;
  List<Data>? data;

  SearchSanctionModel({this.status, this.data});

  SearchSanctionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

  class Data
{
  String? schemeName;
  String? allocatingMinistry;
  String? finYear;
  String? unspentBalance;
  String? status;
  String? dateOfGen;
  String? schemeCode;
  String? lastDate;
  String? eucId;
  String? state_code;
  String? dist_code;

  Data(
      {required this.schemeName,
      required  this.allocatingMinistry,
     required   this.finYear,
      required  this.unspentBalance,
    required    this.status,
       required this.dateOfGen,
        required this.schemeCode,
       required this.lastDate,
       required this.eucId,
        required this.state_code,
        required this.dist_code

      });

  Data.fromJson(Map<String, dynamic> json) {
    schemeName = json['scheme_name'];
    allocatingMinistry = json['allocating_ministry'];
    finYear = json['fin_year'];
    unspentBalance = json['unspent_balance'];
    status = json['status'];
    dateOfGen = json['date_of_gen'];
    schemeCode = json['scheme_code'];
    lastDate = json['last_date'];
    eucId = json['euc_id'];
    state_code = json['state_code'];
    dist_code = json['dist_code'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scheme_name'] = this.schemeName;
    data['allocating_ministry'] = this.allocatingMinistry;
    data['fin_year'] = this.finYear;
    data['unspent_balance'] = this.unspentBalance;
    data['status'] = this.status;
    data['date_of_gen'] = this.dateOfGen;
    data['scheme_code'] = this.schemeCode;
    data['last_date'] = this.lastDate;
    data['euc_id'] = this.eucId;
    data['state_code'] = this.state_code;
    data['dist_code'] = this.dist_code;

    return data;
  }
}

