///  routing management
///  The pages to be displayed are in _pages,
/// always show the last one in _pages,
/// pop is to delete the last item in the array
/// push is to push a new page
///
/// use
///                        onTap: () {
///                               HARouterDelegate.instance.push(HARoutePath.notification());
///                             }
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';


import '../analytics_service.dart';
import '../splash_page.dart';
import 'app_routes.dart';

class HARouterDelegate extends RouterDelegate<HARoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<HARoutePath> {
  static HARouterDelegate instance = HARouterDelegate();
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  HARouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  static HARouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is HARouterDelegate, 'Delegate type must match');
    return delegate as HARouterDelegate;
  }

  List<Page> _pages = <Page>[
    const MaterialPage(
      child: SplashPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        pop();
        return true;
      },
       observers: <NavigatorObserver>[AnalyticsService.observer],
    );
  }

  @override
  Future<void> setNewRoutePath(HARoutePath path) async {}

  showMainTab() {
    var router = HARoutePath.mainTab();
    _pages = [MaterialPage(name: router.name, child: router.widget)];
    notifyListeners();
  }

  popAndPush(HARoutePath router) {
    pop();
    push(router);
  }

  push(HARoutePath router, {bool? fullscreenDialog}) {
    _pages.add(MaterialPage(
        name: router.name,
        child: router.widget,
        fullscreenDialog: fullscreenDialog ?? false));
    notifyListeners();
  }

  pop() {
    if (_pages.length > 1) {
      _pages.remove(_pages.last);
      notifyListeners();
    }
  }

  popAll() {
    while (_pages.length > 1) {
      _pages.remove(_pages.last);
    }
    notifyListeners();
  }

  popBack() {
    if (_pages.length >= 2) {
      _pages.remove(_pages.last);
      _pages.remove(_pages.last);
      notifyListeners();
    }
  }

  void popToPath(HARoutePath path,
      {Object? arguments, maintainState = true, fullscreenDialog = false}) {
    while (_pages.last.name != path.name) {
      _pages.remove(_pages.last);
    }
    notifyListeners();
  }

  // void pushReplacement(RoutePath path) {
  //   if (_pages.isNotEmpty) _pages.removeLast();
  //
  //   push(path);
  // }

  void pushReplacement(HARoutePath router) {
    _pages.removeWhere((element) => element.name == router.name);
    _pages.add(MaterialPage(
        key: ObjectKey(Random()), name: router.name, child: router.widget));
    notifyListeners();
  }

  bool checkPage(HARoutePath path) {
    return _pages.where((element) => element.name == path.name).isNotEmpty;
  }

  logout() {
    // UserManager.instance.updateUser(null);
    // UserDefaults.instance.setStringBy(UserInfo.accessToken, value: null);
    // _pages = [
    //   MaterialPage(
    //     child: SplashPage(),
    //   ),
    // ];
    notifyListeners();
  }

  bool isMainTabExisting() {
    return checkPage(HARoutePath.mainTab());
  }
}
