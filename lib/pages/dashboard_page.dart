import 'package:FitStack/app/models/user/user_model.dart';
import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/features/dashboard/presentation/atoms/featured_list.dart';
import 'package:FitStack/features/dashboard/presentation/molecules/habits_list.dart';
import 'package:FitStack/features/profile/cubit/profile_cubit.dart';
import 'package:FitStack/features/signup/ui/widgets/atoms/profile_avatar_widget.dart';
import 'package:FitStack/widgets/atoms/basic_view_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/statistics/ui/widgets/molecules/featured_log_list.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = context.read<AppBloc>().state.user ?? User.empty();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BasicPageHeader(
            leading: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return ProfileAvatar(
                  onTap: () => context.push("/user"),
                  avatar: context.read<AppBloc>().state.user?.profile.avatar,
                  withBorder: false,
                  maxRadius: 20,
                );
              },
            ),
            title: "Good Morning",
            subtitle: "${user.firstName} ${user.lastName}",
          ),
          const FeatureWidgetList(),
          const HabitsList(),
          const FeaturedLogList(),
        ],
      ),
    );
  }
}
