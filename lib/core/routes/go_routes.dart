import 'package:go_router/go_router.dart';

import '../../features/navigation/presentation/navigation_page.dart';
import '../../features/register/presentation/register_page.dart';
import '../../features/sign_in/presentation/sign_in_page.dart';

class GoRoutes {
  const GoRoutes._();

  static List<RouteBase> routes = [
    GoRoute(
      path: '/sign-in',
      name: 'SignInPage',
      builder: (context, state) {
        return const SignInPage();
      },
    ),
    GoRoute(
      path: '/register',
      name: 'RegisterPage',
      builder: (context, state) {
        return const RegisterPage();
      },
    ),
    GoRoute(
      path: '/navigation',
      name: 'NavigationPage',
      builder: (context, state) {
        return const NavigationPage();
      },
    ),
  ];
}
