import 'package:appointment_project_siprok/src/ui/utilities/screen_change_points.dart';
import 'package:flutter/material.dart';

/// Manage the screen info in all app.
class ScreenInfo {
  ScreenInfo._();

  static ScreenInfo? _instance;

  /// Returns a instance of this class.
  // ignore: prefer_constructors_over_static_methods
  static ScreenInfo get instance {
    return _instance ??= ScreenInfo._();
  }

  double _maxWidth = 1300.0;
  ScreenChangePoints _changePoints = const ScreenChangePoints();

  /// Configure the [maxWidth] and [changePoints] to use in all app.
  ///
  /// Set this values one time in the app, preferably on main function.
  void configure({
    double? maxWidth,
    ScreenChangePoints? changePoints,
  }) {
    if (maxWidth != null) _maxWidth = maxWidth;
    if (changePoints != null) _changePoints = changePoints;
  }

  /// Returns the max width configured for the app screen.
  double get maxwidth => _maxWidth;

  /// Returns the change point of the screen.
  ScreenChangePoints get changePoints => _changePoints;

  /// Returns true if the size of the screen is desktop.
  ///
  /// Use [context] to obtain the Media Query.
  bool desktop(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width >= _changePoints.desktopChangePoint;
  }

  /// Returns true if the size of the screen is phone.
  ///
  /// Use [context] to obtain the Media Query.
  bool phone(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width < _changePoints.tabletChangePoint;
  }

  /// Returns true if the size of the screen is tablet.
  ///
  /// Use [context] to obtain the Media Query.
  bool tablet(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width >= _changePoints.tabletChangePoint &&
        width < _changePoints.desktopChangePoint;
  }

  /// Returns true if the size of the screen is watch.
  ///
  /// Use [context] to obtain the Media Query.
  bool watch(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width < _changePoints.watchChangePoint;
  }
}
