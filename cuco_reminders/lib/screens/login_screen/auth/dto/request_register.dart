class RequestRegister {
  String? fullname;
  String? password;

  RequestRegister({
    this.fullname,
    this.password,
  });

  Map<String, dynamic> toJson(RequestRegister request) {
    return {
      'fullname': request.fullname,
      'password': request.password,
    };
  }
}
