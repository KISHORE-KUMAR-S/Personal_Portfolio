import 'package:go_router/go_router.dart' show GoRoute, GoRouter;

import '../screens/about_page.dart';
import '../screens/contact_page.dart';
import '../screens/experience_page.dart';
import '../screens/home_page.dart';
import '../screens/works_page.dart';
import 'routes.dart';

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: Routes.contact,
      builder: (context, state) => ContactPage(),
    ),
    GoRoute(
      path: Routes.about,
      builder: (context, state) => AboutPage(),
    ),
    GoRoute(
      path: Routes.work,
      builder: (context, state) => WorksPage(),
    ),
    GoRoute(
      path: Routes.experience,
      builder: (context, state) => ExperiencePage(),
    ),
  ],
);
