import 'package:auto_route/auto_route.dart';

import '../../presentation/pages/history_page.dart';
import '../../presentation/pages/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: HistoryPage),
  ],
)
class $AppRouter {}
