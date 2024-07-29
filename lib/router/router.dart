import 'package:go_router/go_router.dart' show GoRoute, GoRouter;
import 'package:personal_portfolio/router/routes.dart';
import 'package:personal_portfolio/screens/about_page.dart';
import 'package:personal_portfolio/screens/contact_page.dart';
import 'package:personal_portfolio/screens/experience_page.dart';
import 'package:personal_portfolio/screens/home_page.dart';
import 'package:personal_portfolio/screens/works_page.dart';

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
