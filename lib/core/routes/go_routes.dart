import 'package:go_router/go_router.dart';

import '../../features/navigation/domain/entities/station_entity.dart';
import '../../features/navigation/presentation/navigation_page.dart';
import '../../features/navigation/presentation/station_detail_page.dart';
import '../../features/register/presentation/register_page.dart';
import '../../features/bookmark/presentation/bookmark_page.dart';
import '../../features/review/presentation/review_page.dart';
import '../../features/setting/presentation/setting_page.dart';
import '../../features/sign_in/presentation/sign_in_page.dart';
import '../../shared/error_page.dart';

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
    GoRoute(
      path: '/station-detail/:stationId',
      builder: (context, state) {
        final stationId = state.pathParameters['stationId'] ?? '';
        return StationDetailPage(stationId: stationId);
      },
    ),
    GoRoute(
      path: '/bookmark',
      name: 'BookmarkPage',
      builder: (context, state) {
        return const BookmarkPage();
      },
    ),
    GoRoute(
      path: '/setting',
      name: 'SettingPage',
      builder: (context, state) {
        return const SettingPage();
      },
    ),
    GoRoute(
      path: '/review',
      builder: (context, state) {
        final stationDetail = state.extra as StationEntity;
        return ReviewPage(stationDetail: stationDetail);
      },
    ),
    GoRoute(
      path: '/error',
      name: 'ErrorPage',
      builder: (context, state) {
        return const ErrorPage();
      },
    ),
  ];
}
