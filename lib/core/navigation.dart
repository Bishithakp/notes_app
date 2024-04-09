import 'package:flutter/material.dart';

toPage(BuildContext context, Widget widget, {String? routeSettingName}) {
  return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget,
      settings: RouteSettings(name: routeSettingName)));
}