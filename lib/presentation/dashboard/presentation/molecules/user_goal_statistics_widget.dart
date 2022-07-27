import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class UserGoalStatisticsWidget extends StatelessWidget {
  const UserGoalStatisticsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfSparkLineChart();
  }
}
