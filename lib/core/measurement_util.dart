import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:help4kids_front/generated/l10n.dart';

/// Small utility to measure a widget before actually putting it on screen.
///
/// This can be helpful e.g. for positioning context menus based on the size they will take up.
///
/// NOTE: Use sparingly, since this takes a complete layout and sizing pass for the subtree you
/// want to measure.
///
/// Compare https://api.flutter.dev/flutter/widgets/BuildOwner-class.html
class MeasureUtil {
  /// Measures the given [widget] with the given [constraints] and returns the size it will take up.
  ///
  /// Usage: `Size size = MeasureUtil.measureWidget(MyWidget().measurable(context));`
  static Size measureWidget(Widget widget,
      [BoxConstraints constraints = const BoxConstraints()]) {
    PipelineOwner pipelineOwner = PipelineOwner();
    _MeasurementView rootView =
        pipelineOwner.rootNode = _MeasurementView(constraints);
    BuildOwner buildOwner = BuildOwner(focusManager: FocusManager());
    RenderObjectToWidgetElement<RenderBox> element =
        RenderObjectToWidgetAdapter<RenderBox>(
      container: rootView,
      debugShortDescription: '[root]',
      child: widget,
    ).attachToRenderTree(buildOwner);
    try {
      rootView.scheduleInitialLayout();
      pipelineOwner.flushLayout();
      return rootView.size;
    } finally {
      // Clean up.
      element
          .update(RenderObjectToWidgetAdapter<RenderBox>(container: rootView));
      buildOwner.finalizeTree();
    }
  }
}

class _MeasurementView extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  final BoxConstraints boxConstraints;
  _MeasurementView(this.boxConstraints);

  @override
  void performLayout() {
    assert(child != null);
    child!.layout(boxConstraints, parentUsesSize: true);
    size = child!.size;
  }

  @override
  void debugAssertDoesMeetConstraints() => true;
}

extension MeasurableWidget on Widget {
  Widget measurable(BuildContext context) {
    return Material(
      child: Localizations(
        locale: const Locale('uk_UA'),
        delegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: MediaQuery(data: MediaQuery.of(context), child: this),
        ),
      ),
    );
  }
}
