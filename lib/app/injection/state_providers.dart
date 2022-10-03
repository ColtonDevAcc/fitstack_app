import 'package:FitStack/app/injection/dependency_injection.dart';
import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/providers/bloc/relationship/relationship_bloc.dart';
import 'package:FitStack/app/providers/cubit/cubit/main_view_cubit.dart';
import 'package:FitStack/presentation/login/cubit/login_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => getIt<AppBloc>(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => getIt<LoginCubit>(),
        ),
        BlocProvider<SignupCubit>(
          create: (context) => getIt<SignupCubit>(),
        ),
        BlocProvider<MainViewCubit>(
          create: (context) => getIt<MainViewCubit>(),
        ),
        BlocProvider<RelationshipBloc>(
          create: (context) => getIt<RelationshipBloc>(),
        ),
      ],
      child: child,
    );
  }
}
