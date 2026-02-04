class OtpState {
  final String? otp;
  final bool isLoading;
  final String? errorMessage;

  OtpState({this.otp, this.isLoading = false, this.errorMessage});

  OtpState copyWith({String? otp, bool? isLoading, String? errorMessage}) {
    return OtpState(
      otp: otp ?? this.otp,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
