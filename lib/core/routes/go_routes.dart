import 'package:go_router/go_router.dart';

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
  ];
  
}