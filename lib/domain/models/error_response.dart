class ErrorResponse {
  List<Errors>? errors;
  bool? success;
  int? code;
  String? message;
  Data? data;

  ErrorResponse({this.errors, this.success, this.code, this.message});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

class Errors {
  int? code;
  String? detail;

  Errors({this.code, this.detail});

  Errors.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['detail'] = detail;
    return data;
  }
}

class Data {
  String? uname;
  int? isReseller;
  String? message;

  Data({this.uname, this.isReseller, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    uname = json['uname'];
    isReseller = json['is_reseller'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uname'] = uname;
    data['is_reseller'] = isReseller;
    data['message'] = message;
    return data;
  }
}
