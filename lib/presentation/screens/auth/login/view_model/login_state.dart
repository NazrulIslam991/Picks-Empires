class LoginStateModel {
  final bool isLoading;

  LoginStateModel({this.isLoading = false});

  LoginStateModel copyWith({bool? isLoading}) {
    return LoginStateModel(isLoading: isLoading ?? this.isLoading);
  }
}
