import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProfileFeaturedStatisticsGraph extends StatelessWidget {
  final Color graphColor;
  final String value;
  final String measurementAbrv;
  final String subtitle;
  const ProfileFeaturedStatisticsGraph(
      {Key? key, required this.graphColor, required this.value, required this.measurementAbrv, required this.subtitle,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_SalesData> data = [
      _SalesData('Jan', 28),
      _SalesData('Feb', 28),
      _SalesData('Mar', 30),
      _SalesData('Apr', 32),
      _SalesData('May', 30),
      _SalesData('Jun', 30),
    ];

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(1, 3),
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        width: 120,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              "$value $measurementAbrv",
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            AutoSizeText(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(.5),
                  ),
              textScaleFactor: .9,
            ),
            Expanded(
              child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                margin: EdgeInsets.zero,
                plotAreaBorderColor: Colors.transparent,
                enableAxisAnimation: true,
                primaryXAxis: CategoryAxis(
                  borderWidth: 0,
                  rangePadding: ChartRangePadding.none,
                  borderColor: Colors.transparent,
                  isVisible: false,
                ),
                primaryYAxis: CategoryAxis(
                  borderWidth: 0,
                  rangePadding: ChartRangePadding.none,
                  borderColor: Colors.transparent,
                  isVisible: false,
                ),
                legend: Legend(isVisible: false),
                series: <ChartSeries<_SalesData, String>>[
                  SplineAreaSeries<_SalesData, String>(
                    borderColor: graphColor,
                    borderWidth: 3,
                    splineType: SplineType.monotonic,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [.01, 1],
                      colors: [
                        graphColor,
                        Colors.white,
                      ],
                    ),
                    dataSource: data,
                    xValueMapper: (_SalesData sales, _) => sales.year,
                    yValueMapper: (_SalesData sales, _) => sales.sales,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
