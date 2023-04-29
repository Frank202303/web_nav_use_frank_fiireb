/// define HARoutePath class: has 3 paras
/// page name, page parameters  and  widget
///
/// For each page, define a named constructor,
///
/// use: navi to mainTab page.
///  HARouterDelegate.instance.push(HARoutePath.mainTab());

import 'package:flutter/cupertino.dart';


import '../main_tab_page.dart';
import '../splash_page.dart';
import '../values/string_manager.dart';

class HARoutePath {
  final String name;
  final Map<String, dynamic>? parameters;
  final Widget widget;

  HARoutePath.splash({this.parameters})
      : name = HAStrings.launchScreen,
        widget =   SplashPage();

  HARoutePath.mainTab({this.parameters})
      //maintabpage
      : name = HAStrings.mainTab,
        widget =   MainTabPage();


}
