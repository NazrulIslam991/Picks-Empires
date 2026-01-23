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
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
