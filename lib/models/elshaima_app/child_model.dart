class ElshaimaChildModel {
  String msg;
  Data data;

  ElshaimaChildModel({this.msg, this.data});

  ElshaimaChildModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Kids> kids;

  Data({this.kids});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['kids'] != null) {
      kids = new List<Kids>();
      json['kids'].forEach((v) {
        kids.add(new Kids.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.kids != null) {
      data['kids'] = this.kids.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Kids {
  String name;
  int fathersId;
  int id;
  String createAt;
  String updateAt;
  Null createFrom;
  Null deleteFrom;
  Null updateFrom;

  Kids(
      {this.name,
        this.fathersId,
        this.id,
        this.createAt,
        this.updateAt,
        this.createFrom,
        this.deleteFrom,
        this.updateFrom
  });

  Kids.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fathersId = json['fathers_id'];
    id = json['id'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    createFrom = json['create_from'];
    deleteFrom = json['delete_from'];
    updateFrom = json['update_from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['fathers_id'] = this.fathersId;
    data['id'] = this.id;
    data['create_at'] = this.createAt;
    data['update_at'] = this.updateAt;
    data['create_from'] = this.createFrom;
    data['delete_from'] = this.deleteFrom;
    data['update_from'] = this.updateFrom;
    return data;
  }
}
