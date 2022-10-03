import 'package:FitStack/app/injection/dependency_injection.dart';
import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/providers/bloc/relationship/relationship_bloc.dart';
import 'package:FitStack/app/providers/cubit/cubit/main_view_cubit.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/app/repository/relationship_repository.dart';
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:FitStack/presentation/login/cubit/login_cubit.dart';
import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';

class CoreDependencies implements Dependencies {
  @override
  Future<void> init() async {
    //!blocs
    getIt.registerFactory<AppBloc>(
      () => AppBloc(authenticationRepository: getIt<AuthenticationRepository>(), userRepository: getIt<UserRepository>()),
    );
    getIt.registerFactory<LoginCubit>(() => LoginCubit(authenticationRepository: getIt<AuthenticationRepository>()));
    getIt.registerFactory<SignupCubit>(() => SignupCubit(authenticationRepository: getIt<AuthenticationRepository>()));
    getIt.registerFactory<MainViewCubit>(() => MainViewCubit());
    getIt.registerFactory<RelationshipBloc>(() => RelationshipBloc(relationshipRepository: getIt<RelationshipRepository>()));

    //!repositories
    getIt.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepository());
    getIt.registerLazySingleton<UserRepository>(() => UserRepository());
    getIt.registerLazySingleton<RelationshipRepository>(() => RelationshipRepository());
  }
}
