class ErrorModel {
  ErrorModel({this.message, this.errors});

  ErrorModel.fromJson(dynamic json) {
    message = json['message'];
    errors = json['error'];
  }

  String? message;
  String? errors;
}
