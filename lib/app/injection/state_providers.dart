import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/providers/cubit/main_view/main_view_cubit.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/app/repository/relationship_repository.dart';
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:FitStack/presentation/login/cubit/login_cubit.dart';
import 'package:FitStack/presentation/profile/cubit/profile_cubit.dart';
import 'package:FitStack/presentation/relationship/cubit/friendship/friendship_cubit.dart';
import 'package:FitStack/presentation/settings/cubit/settings_cubit.dart';
import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
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
            create: (BuildContext context) => ProfileCubit(userRepository: context.read<UserRepository>()),
          ),
          BlocProvider<FriendshipCubit>(
            create: (BuildContext context) => FriendshipCubit(relationshipRepository: context.read<RelationshipRepository>()),
          ),
          BlocProvider<SettingsCubit>(
            create: (BuildContext context) => SettingsCubit(),
          ),
        ],
        child: child,
      ),
    );
  }
}
