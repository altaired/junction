import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:junction/shared/color_palatte.dart';

class BarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  BarChart(this.seriesList, {this.animate});

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory BarChart.withSampleData() {
    return new BarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(seriesList,
        animate: animate,
        barGroupingType: charts.BarGroupingType.stacked,
        customSeriesRenderers: [
          new charts.BarTargetLineRendererConfig<String>(
              // ID used to link series to this renderer.
              customRendererId: 'customTargetLine',
              groupingType: charts.BarGroupingType.stacked)
        ]);
  }

  static List<charts.Series<OrdinalCarbonData, String>> _createSampleData() {
    final personalCarbonData = [
      new OrdinalCarbonData('week 34', 35, 6),
      new OrdinalCarbonData('week 35', 42, 4),
      new OrdinalCarbonData('week 36', 40, 5),
      new OrdinalCarbonData('week 37', 47, 3),
    ];

    final groupTargetLineData = [
      new OrdinalCarbonData('week 34', 30, 0),
      new OrdinalCarbonData('week 35', 30, 0),
      new OrdinalCarbonData('week 36', 30, 0),
      new OrdinalCarbonData('week 37', 30, 0),
    ];

    // the next target data line becomes the sum of it self and the previous, so 30000 + 20000 = 50000 in the graph .. don't ask me why
    final personalTargetLineData = [
      new OrdinalCarbonData('week 34', 20, 0),
      new OrdinalCarbonData('week 35', 20, 0),
      new OrdinalCarbonData('week 36', 20, 0),
      new OrdinalCarbonData('week 37', 20, 0),
    ];

    return [
      new charts.Series<OrdinalCarbonData, String>(
        id: 'personalclimateCompensated',
        domainFn: (OrdinalCarbonData carbonData, _) => carbonData.date,
        measureFn: (OrdinalCarbonData carbonData, _) =>
            carbonData.climateCompensated,
        colorFn: (a, b) => toChartColor(ColorPalatte.resedaGreen),
        data: personalCarbonData,
      ),
      new charts.Series<OrdinalCarbonData, String>(
        id: 'personalCarbonData',
        domainFn: (OrdinalCarbonData carbonData, _) => carbonData.date,
        measureFn: (OrdinalCarbonData carbonData, _) =>
            carbonData.totalCarbon - carbonData.climateCompensated,
        colorFn: (a, b) => toChartColor(ColorPalatte.saphireBlue),
        data: personalCarbonData,
      ),
      new charts.Series<OrdinalCarbonData, String>(
        id: 'group Target Line Data',
        domainFn: (OrdinalCarbonData carbonData, _) => carbonData.date,
        measureFn: (OrdinalCarbonData carbonData, _) => carbonData.totalCarbon,
        colorFn: (a, b) => toChartColor(ColorPalatte.emeraldGreen),
        data: groupTargetLineData,
      )..setAttribute(charts.rendererIdKey, 'customTargetLine'),
      new charts.Series<OrdinalCarbonData, String>(
        id: 'persona lTarget Line Data',
        domainFn: (OrdinalCarbonData carbonData, _) => carbonData.date,
        measureFn: (OrdinalCarbonData carbonData, _) => carbonData.totalCarbon,
        colorFn: (a, b) => toChartColor(ColorPalatte.emeraldGreen),
        data: personalTargetLineData,
      )..setAttribute(charts.rendererIdKey, 'customTargetLine'),
    ];
  }

  static charts.Color toChartColor(Color color) {
    return new charts.Color(
        r: color.red, g: color.green, b: color.blue, a: color.alpha);
  }
}

class OrdinalCarbonData {
  final String date;
  final int totalCarbon;
  final int climateCompensated;

  OrdinalCarbonData(this.date, this.totalCarbon, this.climateCompensated) {}
}
