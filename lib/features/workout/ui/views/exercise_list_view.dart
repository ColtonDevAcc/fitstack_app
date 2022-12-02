import 'package:FitStack/app/providers/bloc/exercise/exercise_bloc.dart';
import 'package:FitStack/features/workout/ui/widgets/atoms/exercise_list_tile.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:go_router/go_router.dart';

class ExerciseListView extends StatelessWidget {
  const ExerciseListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: Container(
              height: MediaQuery.of(context).size.height * .25,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: BasicPageHeader(
                      title: 'Exercises',
                      leading: GestureDetector(
                        onTap: () => context.pop(),
                        child: Icon(FontAwesome.arrow_left_long, color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                  ),
                  Text("Add an exercise", style: Theme.of(context).textTheme.headlineLarge),
                  SizedBox(height: 10),
                  BlocBuilder<ExerciseBloc, ExerciseState>(
                    builder: (context, state) {
                      return Container(
                        width: double.infinity,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
                            prefixIcon: Icon(FontAwesome.magnifying_glass, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.09),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.09),
            child: BlocBuilder<ExerciseBloc, ExerciseState>(
              buildWhen: (previous, current) => previous.exercises != current.exercises,
              builder: (context, state) {
                return state.status == ExerciseListStatus.loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: state.exercises.map((e) {
                          return ExerciseListTile(
                            exercise: e,
                          );
                        }).toList(),
                      );
              },
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                "NEXT",
                textScaleFactor: 1.2,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          )
        ],
      ),
    );
  }
}
