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
        return MaterialPageRoute(builder: (_) => OtpScreen()); // OTP screen
      case RouteName.categoryScreen:
        return MaterialPageRoute(
          builder: (_) => const CategoryScreen(),
        ); // login Screen
      case RouteName.forgotPassword_EmailScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordEmailScreen(),
        ); // forgot password email screen
      case RouteName.forgotPassword_OTPScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordOtpScreen(),
        ); // forgot password OTP screen
      case RouteName.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        ); // reset password screen
      case RouteName.navBarScreen:
        return MaterialPageRoute(
          builder: (_) => const NavbarScreen(),
        ); // reset password
      case RouteName.subscriptionScreen:
        return MaterialPageRoute(
          builder: (_) => const SubscriptionScreen(),
        ); // subsCription screen
      case RouteName.subsConfirmationScreen:
        return MaterialPageRoute(
          builder: (_) => const ConfirmationScreen(),
        ); // subsConfirmationScreen
      case RouteName.addNewCardScreen:
        return MaterialPageRoute(
          builder: (_) => const AddNewCardScreen(),
        ); // AddNewCardScreen
      case RouteName.subSuccessScreen:
        return MaterialPageRoute(
          builder: (_) => const SubscriptionSuccessfullScreen(),
        ); // subSuccessScreen screen
      case RouteName.notificationScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        ); // home screen
      case RouteName.profileScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        ); // Profile screen
      case RouteName.settingScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        ); // setting screen
      case RouteName.helpAndSupportScreen:
        return MaterialPageRoute(
          builder: (_) => const HelpAndSupportScreen(),
        ); // helpAndSupportScreen screen
      case RouteName.legalAndPolicyScreen:
        return MaterialPageRoute(
          builder: (_) => const LegalAndPolicyScreen(),
        ); // legalAndPolicyScreen screen
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
