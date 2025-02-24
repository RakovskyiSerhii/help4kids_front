import 'package:go_router/go_router.dart';

extension GoRouterExtension on GoRouter {
  String location() {
    RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    RouteMatchList matchList =
        lastMatch is ImperativeRouteMatch ? lastMatch.matches : routerDelegate.currentConfiguration;
    String location = matchList.uri.toString();
    return location;
  }
}
