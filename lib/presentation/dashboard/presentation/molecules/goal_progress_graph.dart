import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GoalProgressGraph extends StatelessWidget {
  const GoalProgressGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = [
      _SalesData('Jan', 28),
      _SalesData('Feb', 28),
      _SalesData('Mar', 30),
      _SalesData('Apr', 32),
      _SalesData('May', 30),
      _SalesData('Jun', 30),
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.surface,
      ),
      width: 150,
      height: 175,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2,365 lbs',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              'Weight Gain',
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
                borderColor: Colors.transparent,
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
                    borderColor: Color.fromRGBO(87, 54, 232, 1),
                    borderWidth: 3,
                    borderDrawMode: BorderDrawMode.top,
                    splineType: SplineType.monotonic,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [.01, 1],
                      colors: [
                        Color.fromRGBO(87, 54, 232, 1),
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
