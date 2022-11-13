import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/providers/bloc/workout/workout_bloc.dart';
import 'package:FitStack/app/providers/cubit/main_view/main_view_cubit.dart';
import 'package:FitStack/app/providers/cubit/user_statistic/user_statistic_cubit.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/app/repository/program_repository.dart';
import 'package:FitStack/app/repository/relationship_repository.dart';
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:FitStack/app/repository/workout_repository.dart';
import 'package:FitStack/presentation/login/cubit/login_cubit.dart';
import 'package:FitStack/presentation/profile/cubit/profile_cubit.dart';
import 'package:FitStack/presentation/relationship/cubit/friendship/friendship_cubit.dart';
import 'package:FitStack/presentation/settings/cubit/settings_cubit.dart';
import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:FitStack/presentation/workout/cubit/program_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateProviders extends StatelessWidget {
  final Widget child;
  const StateProviders({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //! blocs/repository registration
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthenticationRepository()),
        RepositoryProvider(create: (context) => UserRepository()),
        RepositoryProvider(create: (context) => RelationshipRepository()),
        RepositoryProvider(create: (context) => ProgramRepository()),
        RepositoryProvider(create: (context) => WorkoutRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (BuildContext context) => AppBloc(
              authenticationRepository: context.read<AuthenticationRepository>(),
              userRepository: context.read<UserRepository>(),
            ),
          ),
          BlocProvider<LoginCubit>(
            create: (BuildContext context) => LoginCubit(
              authenticationRepository: context.read<AuthenticationRepository>()..persistLogin(),
            ),
          ),
          BlocProvider<SignupCubit>(
            create: (BuildContext context) => SignupCubit(
              authRepository: context.read<AuthenticationRepository>(),
            ),
          ),
          BlocProvider<MainViewCubit>(
            create: (BuildContext context) => MainViewCubit(),
          ),
          BlocProvider<ProfileCubit>(
            create: (BuildContext context) => ProfileCubit(
              user: context.read<AppBloc>().state.user,
              userRepository: context.read<UserRepository>(),
            ),
          ),
          BlocProvider<FriendshipCubit>(
            create: (BuildContext context) => FriendshipCubit(relationshipRepository: context.read<RelationshipRepository>()),
          ),
          BlocProvider<SettingsCubit>(
            create: (BuildContext context) => SettingsCubit(),
          ),
          BlocProvider<ProgramCubit>(
            create: (BuildContext context) => ProgramCubit(programRepository: context.read<ProgramRepository>()),
          ),
          BlocProvider<UserStatisticCubit>(
            create: (BuildContext context) => UserStatisticCubit(userRepository: context.read<UserRepository>())..getUserStatistic(),
          ),
          BlocProvider<WorkoutBloc>(
            create: (BuildContext context) => WorkoutBloc(
              workoutRepository: context.read<WorkoutRepository>(),
            )..add(WorkoutStreamSubscriptionRequested()),
          ),
        ],
        child: child,
      ),
    );
  }
}
