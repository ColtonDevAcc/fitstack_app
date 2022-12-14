import 'package:FitStack/app/models/workout/exercise_model.dart';
import 'package:FitStack/app/providers/bloc/exercise/exercise_bloc.dart';
import 'package:FitStack/features/workout/ui/widgets/atoms/exercise_muscle_selector.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

class EditExerciseView extends StatelessWidget {
  const EditExerciseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocBuilder<ExerciseBloc, ExerciseState>(
        builder: (context, state) {
          final bool emptyImageList = state.currentlyEditingExercise.images == null || state.currentlyEditingExercise.images!.isEmpty;
          return Scrollbar(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BasicPageHeader(
                      title: "${state.currentlyEditingExercise.name}",
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: Container(
                            child: Icon(
                              Icons.arrow_back,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(child: ExerciseTextField(label: "Name", hintText: state.currentlyEditingExercise.name ?? "")),
                              const SizedBox(width: 10),
                              Expanded(child: ExerciseTextField(label: "MET", hintText: state.currentlyEditingExercise.metValue.toString())),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ExerciseTextField(label: "Description", hintText: state.currentlyEditingExercise.description ?? "", maxLines: 3),
                          const SizedBox(height: 20),
                          ExerciseTextField(
                            label: "Exercise Type",
                            hintText: state.currentlyEditingExercise.type.toString(),
                            maxLines: 1,
                            dropDown: true,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Text(
                        "Images",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: emptyImageList ? 1 : state.currentlyEditingExercise.images!.length + 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () {
                                if (emptyImageList && index == 0 || index == state.currentlyEditingExercise.images!.length) {
                                  context.read<ExerciseBloc>().add(const EditExerciseImage());
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: emptyImageList || index == state.currentlyEditingExercise.images!.length
                                      ? null
                                      : DecorationImage(
                                          image: ExtendedNetworkImageProvider(state.currentlyEditingExercise.images![index]),
                                          fit: BoxFit.cover,
                                        ),
                                  color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
                                ),
                                width: 250,
                                child: emptyImageList || index == state.currentlyEditingExercise.images!.length
                                    ? Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Theme.of(context).colorScheme.onBackground,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: ExerciseMuscleSelector(
                        majorMuscles: state.majorMuscles,
                        minorMuscles: state.minorMuscles,
                        frontMuscleList: state.frontMuscleList,
                        majorMuscleColor: Theme.of(context).colorScheme.error,
                        minorMuscleColor: Colors.yellow,
                        onMajorMuscleSelected: (TapUpDetails, Muscle) => context.read<ExerciseBloc>().add(SelectMajorMuscle(muscle: Muscle)),
                        onMinorMuscleSelected: (LongPressEndDetails, Muscle) => context.read<ExerciseBloc>().add(SelectMinorMuscle(muscle: Muscle)),
                        onIconPressed: () => context.read<ExerciseBloc>().add(const RotateMuscleAnatomyView()),
                        muscleAnatomyViewRotationIndex: state.muscleAnatomyViewRotationIndex,
                        backMuscleList: state.backMuscleList,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ExerciseTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final int? maxLines;
  final bool? dropDown;
  const ExerciseTextField({Key? key, required this.label, required this.hintText, this.maxLines, this.dropDown}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (dropDown != true)
          FormBuilderTextField(
            name: label,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.surface,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                fontSize: 18,
              ),
              labelText: label,
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                fontSize: 18,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.surface),
              ),
            ),
          ),
        if (dropDown == true)
          FormBuilderDropdown(
            name: label,
            items: const [
              DropdownMenuItem(
                value: ExerciseType.push,
                child: Text("Push", style: TextStyle(fontSize: 20)),
              ),
              DropdownMenuItem(
                value: ExerciseType.pull,
                child: Text("Pull", style: TextStyle(fontSize: 20)),
              ),
              DropdownMenuItem(
                value: ExerciseType.legs,
                child: Text("Legs", style: TextStyle(fontSize: 20)),
              ),
              DropdownMenuItem(
                value: ExerciseType.core,
                child: Text("Core", style: TextStyle(fontSize: 20)),
              ),
              DropdownMenuItem(
                value: ExerciseType.other,
                child: Text("Other", style: TextStyle(fontSize: 20)),
              ),
            ],
            decoration: InputDecoration(
              labelText: label,
              hintText: hintText,
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
                fontSize: 18,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.surface),
              ),
              fillColor: Theme.of(context).colorScheme.surface,
              filled: true,
            ),
          ),
      ],
    );
  }
}
