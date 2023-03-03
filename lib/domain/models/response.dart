class ResponseAPI {
  bool? status;
  String? message;
  Forms? forms;
  dynamic data;

  ResponseAPI({this.status, this.message, this.forms, this.data});

  ResponseAPI.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    forms = json['forms'] != null ? Forms.fromJson(json['forms']) : null;
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (forms != null) {
      data['forms'] = forms!.toJson();
    }
    data['data'] = this.data;
    return data;
  }
}

class Forms {
  String? userId;
  String? zoneId;

  Forms({this.userId, this.zoneId});

  Forms.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    zoneId = json['zone_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['zone_id'] = zoneId;
    return data;
  }
}
