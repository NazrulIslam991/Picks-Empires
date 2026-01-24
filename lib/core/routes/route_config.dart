part of 'route_import_path.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        ); // splash screen
      case RouteName.onBordingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnbordingScreen(),
        ); // OnBording Screen
      case RouteName.logInScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ); // login Screen
      case RouteName.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        ); // SignUp screen
      case RouteName.otpScreen:
        final user = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (_) => OtpScreen(user: user),
        ); // OTP screen
      case RouteName.categoryScreen:
        return MaterialPageRoute(
          builder: (_) => const CategoryScreen(),
        ); // login Screen
      case RouteName.forgotPassword_EmailScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordEmailScreen(),
        );
      case RouteName.forgotPassword_OTPScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordOtpScreen(),
        );
      case RouteName.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
