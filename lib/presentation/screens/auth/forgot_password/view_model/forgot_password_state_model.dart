class ForgotPasswordStateModel {
  final bool isLoading;

  ForgotPasswordStateModel({this.isLoading = false});

  ForgotPasswordStateModel copyWith({bool? isLoading}) {
    return ForgotPasswordStateModel(isLoading: isLoading ?? this.isLoading);
  }
}
