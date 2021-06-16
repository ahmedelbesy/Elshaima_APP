class ElshaimaLoginModel {
  String msg;
  String token;
  Data data;

  ElshaimaLoginModel({this.msg, this.token, this.data});

  ElshaimaLoginModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String username;
  String name;
  String password;
  String phone;
  String fcmToken;
  int login_s;
  int id;
  String createAt;
  String updateAt;
  Null createFrom;
  Null deleteFrom;
  Null updateFrom;

  Data(
      {this.username,
        this.name,
        this.password,
        this.phone,
        this.fcmToken,
        this.login_s,
        this.id,
        this.createAt,
        this.updateAt,
        this.createFrom,
        this.deleteFrom,
        this.updateFrom});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    fcmToken = json['fcm_token'];
    login_s = json['login_s'];
    id = json['id'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    createFrom = json['create_from'];
    deleteFrom = json['delete_from'];
    updateFrom = json['update_from'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['name'] = this.name;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['fcm_token'] = this.fcmToken;
    data['login_s'] = this.login_s;
    data['id'] = this.id;
    data['create_at'] = this.createAt;
    data['update_at'] = this.updateAt;
    data['create_from'] = this.createFrom;
    data['delete_from'] = this.deleteFrom;
    data['update_from'] = this.updateFrom;
    return data;
  }
}
