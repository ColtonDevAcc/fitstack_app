import 'package:FitStack/app/providers/bloc/user_statistics/user_statistics_bloc.dart';
import 'package:FitStack/features/dashboard/presentation/atoms/user_goal_statistics_graph.dart';
import 'package:FitStack/features/statistics/ui/widgets/atoms/featured_feedback_report_card.dart';
import 'package:FitStack/features/statistics/ui/widgets/atoms/report_tab_container.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health/health.dart';

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
                  tabs: const [
                    ReportTabContainer(),
                    ReportTabContainer(),
                    ReportTabContainer(),
                    ReportTabContainer(),
                    ReportTabContainer(),
                    ReportTabContainer(),
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

class ReportTabView extends StatelessWidget {
  const ReportTabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: [
        const FeaturedFeedbackReportCard(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StatisticValueCard(
              title: 'Exercise',
              value: '12',
              color: Theme.of(context).colorScheme.secondaryContainer,
              emoji: ':fire:',
            ),
            StatisticValueCard(
              title: '809',
              value: 'Calories',
              color: Theme.of(context).colorScheme.errorContainer,
              emoji: ':muscle:',
            ),
            StatisticValueCard(
              title: '60',
              value: 'minutes',
              color: Theme.of(context).colorScheme.tertiaryContainer,
              emoji: ':stopwatch:',
            ),
          ],
        ),
        //fl grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: UserGoalStatisticsGraph(
            color: Theme.of(context).colorScheme.secondary,
            dataType: HealthDataType.ACTIVE_ENERGY_BURNED,
            subtitle: 'stuff',
            title: 'Activities',
            updating: false,
            width: double.infinity,
            data: context.watch<UserStatisticsBloc>().state.userStatistic.activeEnergyBurned,
          ),
        ),
      ],
    );
  }
}

class StatisticValueCard extends StatelessWidget {
  final String title;
  final String value;
  final String emoji;
  final Color? color;
  const StatisticValueCard({
    Key? key,
    required this.title,
    required this.value,
    required this.emoji,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();

    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * .25,
      height: 125,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: color ?? Theme.of(context).colorScheme.surface),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: AutoSizeText(
              parser.emojify(emoji),
              textScaleFactor: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              value,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
            ),
          ),
          AutoSizeText(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
