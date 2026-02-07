class SignupModel {
  String? name;
  String? email;
  String? password;
  String? confirmPass;

  SignupModel({this.name, this.email, this.password, this.confirmPass});

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'password': password};
  }
}
