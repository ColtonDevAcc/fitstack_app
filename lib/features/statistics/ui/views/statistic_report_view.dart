import 'package:FitStack/features/statistics/ui/views/report_tab_view.dart';
import 'package:FitStack/features/statistics/ui/widgets/atoms/report_tab_container.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatisticReportView extends StatelessWidget {
  const StatisticReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 6,
          animationDuration: Duration.zero,
          child: SingleChildScrollView(
            child: Column(
              children: [
                BasicPageHeader(
                  title: 'Report',
                  subtitle: '25 August',
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).colorScheme.surface,
                      border: Border.all(color: Theme.of(context).colorScheme.onBackground),
                    ),
                    child: IconButton(
                      icon: FaIcon(FontAwesomeIcons.chevronLeft, color: Theme.of(context).colorScheme.primary),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                TabBar(
                  padding: const EdgeInsets.only(left: 20),
                  isScrollable: true,
                  labelColor: Theme.of(context).colorScheme.background,
                  unselectedLabelColor: Theme.of(context).colorScheme.onBackground,
                  unselectedLabelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 0,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                  tabs: [
                    for (var i = 0; i < 6; i++) ReportTabContainer(date: DateTime.now().subtract(Duration(days: i))),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const TabBarView(
                    children: [
                      ReportTabView(),
                      ReportTabView(),
                      ReportTabView(),
                      ReportTabView(),
                      ReportTabView(),
                      ReportTabView(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
