import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class BarChartAggragate extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  BarChartAggragate(this.seriesList, {this.animate});

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory BarChartAggragate.withSampleData() {
    return new BarChartAggragate(
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
      new OrdinalCarbonData('week 34', 35000, 6000),
      new OrdinalCarbonData('week 35', 42000, 4000),
      new OrdinalCarbonData('week 36', 40000, 5000),
      new OrdinalCarbonData('week 37', 47000, 3000),
    ];

    final groupTargetLineData = [
      new OrdinalCarbonData('week 34', 30000, 0),
      new OrdinalCarbonData('week 35', 30000, 0),
      new OrdinalCarbonData('week 36', 30000, 0),
      new OrdinalCarbonData('week 37', 30000, 0),
    ];

    // the next target data line becomes the sum of it self and the previous, so 30000 + 20000 = 50000 in the graph .. don't ask me why
    final personalTargetLineData = [
      new OrdinalCarbonData('week 34', 20000, 0),
      new OrdinalCarbonData('week 35', 20000, 0),
      new OrdinalCarbonData('week 36', 20000, 0),
      new OrdinalCarbonData('week 37', 20000, 0),
    ];

    return [
      new charts.Series<OrdinalCarbonData, String>(
        id: 'personalclimateCompensated',
        domainFn: (OrdinalCarbonData carbonData, _) => carbonData.date,
        measureFn: (OrdinalCarbonData carbonData, _) => carbonData.climateCompensated,
        data: personalCarbonData,
      ),

      new charts.Series<OrdinalCarbonData, String>(
        id: 'personalCarbonData',
        domainFn: (OrdinalCarbonData carbonData, _) => carbonData.date,
        measureFn: (OrdinalCarbonData carbonData, _) => carbonData.totalCarbon - carbonData.climateCompensated,
        data: personalCarbonData,
      ),

      new charts.Series<OrdinalCarbonData, String>(
        id: 'group Target Line Data',
        domainFn: (OrdinalCarbonData carbonData, _) => carbonData.date,
        measureFn: (OrdinalCarbonData carbonData, _) => carbonData.totalCarbon,
        data: groupTargetLineData,
      )
        ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
      new charts.Series<OrdinalCarbonData, String>(
        id: 'persona lTarget Line Data',
        domainFn: (OrdinalCarbonData carbonData, _) => carbonData.date,
        measureFn: (OrdinalCarbonData carbonData, _) => carbonData.totalCarbon,
        data: personalTargetLineData,
      )
        ..setAttribute(charts.rendererIdKey, 'customTargetLine'),
    ];
  }

}


class OrdinalCarbonData {
  final String date;
  final int totalCarbon;
  final int climateCompensated;

  OrdinalCarbonData(this.date, this.totalCarbon, this.climateCompensated) {}
}

