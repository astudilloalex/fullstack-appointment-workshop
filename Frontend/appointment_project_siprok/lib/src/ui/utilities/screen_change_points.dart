/// Manage the responsive change points.
class ScreenChangePoints {
  /// Define a [ScreenChangePoints] class.
  const ScreenChangePoints({
    this.desktopChangePoint = 1200.0,
    this.tabletChangePoint = 600.0,
    this.watchChangePoint = 300.0,
  });

  /// When the width is greater than this value or equal
  /// the display will be set as `Desktop`.
  final double desktopChangePoint;

  /// When the width is greater than this value or equal
  /// the display will be set as `Tablet`
  /// or when width greater than [watchChangePoint] and smaller than this value
  /// the display will be `Phone`.
  final double tabletChangePoint;

  /// When the width is smaller than this value
  /// the display will be set as `Watch`
  /// or when width greater than this value and smaller than [tabletChangePoint]
  /// the display will be `Phone`
  final double watchChangePoint;
}
