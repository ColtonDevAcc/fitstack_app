import 'package:FitStack/app/providers/bloc/workout/workout_bloc.dart';
import 'package:FitStack/presentation/exercise/presentation/atoms/circular_statistics_progressIndicator.dart';
import 'package:FitStack/presentation/exercise/presentation/molecules/program_card.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutTabView extends StatelessWidget {
  const WorkoutTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.vertical,
      slivers: [
        BlocBuilder<WorkoutBloc, WorkoutState>(
          buildWhen: (previous, current) => previous.workouts != current.workouts || previous.status != current.status,
          builder: (context, state) {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  SlideInDown(
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "3/7\n",
                                  style: Theme.of(context).textTheme.headline6,
                                  children: [
                                    TextSpan(
                                      text: "Week",
                                      style: Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircularStatisticsProgressIndicator(
                                      ratio: 30,
                                      innerColor: Color.fromRGBO(15, 186, 184, 1),
                                      outerColor: Theme.of(context).colorScheme.primary,
                                      label: 'M',
                                    ),
                                    CircularStatisticsProgressIndicator(
                                      ratio: 30,
                                      innerColor: Color.fromRGBO(15, 186, 184, 1),
                                      outerColor: Theme.of(context).colorScheme.primary,
                                      label: 'T',
                                    ),
                                    CircularStatisticsProgressIndicator(
                                      ratio: 30,
                                      innerColor: Color.fromRGBO(15, 186, 184, 1),
                                      outerColor: Theme.of(context).colorScheme.primary,
                                      label: 'W',
                                    ),
                                    CircularStatisticsProgressIndicator(
                                      ratio: 30,
                                      innerColor: Color.fromRGBO(15, 186, 184, 1),
                                      outerColor: Theme.of(context).colorScheme.primary,
                                      label: 'T',
                                    ),
                                    CircularStatisticsProgressIndicator(
                                      ratio: 30,
                                      innerColor: Color.fromRGBO(15, 186, 184, 1),
                                      outerColor: Theme.of(context).colorScheme.primary,
                                      label: 'F',
                                    ),
                                    CircularStatisticsProgressIndicator(
                                      ratio: 30,
                                      innerColor: Color.fromRGBO(15, 186, 184, 1),
                                      outerColor: Theme.of(context).colorScheme.primary,
                                      label: 'S',
                                    ),
                                    CircularStatisticsProgressIndicator(
                                      ratio: 30,
                                      innerColor: Color.fromRGBO(15, 186, 184, 1),
                                      outerColor: Theme.of(context).colorScheme.primary,
                                      label: 'S',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    duration: Duration(milliseconds: 300),
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: state.workouts.isEmpty
                        ? [
                            SizedBox(height: 20),
                            Center(child: CircularProgressIndicator()),
                          ]
                        : state.workouts
                            .map(
                              (workout) => GestureDetector(
                                child: ProgramCard(
                                  description: workout.creator?.profile.display_name ?? "you",
                                  title: workout.title ?? "no title",
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
