import 'package:go_router/go_router.dart';

import '../../features/home/pages/history_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/inc_exp/pages/add_page.dart';
import '../../features/inc_exp/pages/edit_page.dart';
import '../../features/news/pages/detail_news_page.dart';
import '../../features/news/pages/news_page.dart';
import '../../features/settings/pages/profile_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/onboard_profile_page.dart';
import '../../features/splash/splash_page.dart';
import '../models/inc_exp.dart';
import '../models/newss.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) {
        return const OnboardPage();
      },
      routes: [
        GoRoute(
          path: 'profile',
          builder: (context, state) {
            return const OnboardProfilePage();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'add',
          builder: (context, state) {
            return AddPage(
              isIncome: state.extra as bool,
            );
          },
        ),
        GoRoute(
          path: 'edit',
          builder: (context, state) {
            return EditPage(
              model: state.extra as IncExp,
            );
          },
        ),
        GoRoute(
          path: 'history',
          builder: (context, state) {
            return const HistoryPage();
          },
        ),
        GoRoute(
          path: 'news',
          builder: (context, state) {
            return const NewsPage();
          },
        ),
        GoRoute(
          path: 'detailnews',
          builder: (context, state) {
            return DetailNewsPage(
              newss: state.extra as Newss,
            );
          },
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) {
            return const ProfilePage();
          },
        ),
      ],
    ),
  ],
);
