import 'package:auto_route/auto_route.dart';
import 'package:example/mobile/router/router.gr.dart';
import 'package:flutter/cupertino.dart';




// mock auth state
var isAuthenticated = false;

class AuthGuard extends AutoRouteGuard {
 static List<AutoRoute>? childList = [
    AutoRoute(page: MyBooksRoute.page),
    AutoRoute(page: ProfileRoute.page,),
  ];
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!isAuthenticated) {
      // ignore: unawaited_futures
      // router.pushAndPopUntil(
      //   LoginRoute(onLoginResult: (_) {
      //     isAuthenticated = true;
      //     // we can't pop the bottom page in the navigator's stack
      //     // so we just remove it from our local stack
      //     resolver.next();
      //     router.removeLast();
      //   }),
      //   predicate: (r) => true,
      // );
    } else {
      resolver.next(true);
    }
  }
}

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }
}
