import 'package:FitStack/app/models/user/user_profile_model.dart';
import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/features/profile/cubit/profile_cubit.dart';
import 'package:FitStack/features/profile/presentation/atoms/profile_featured_user_statistics.dart';
import 'package:FitStack/features/profile/presentation/molecules/user_profile_achievements_list.dart';
import 'package:FitStack/features/profile/presentation/molecules/user_profile_challenge_badges_list.dart';
import 'package:FitStack/features/profile/presentation/molecules/profile_snapshot.dart';
import 'package:FitStack/features/profile/presentation/organisms/profile_drawer.dart';
import 'package:FitStack/features/relationship/presentation/molecules/friendship_profile_card.dart';
import 'package:FitStack/widgets/atoms/list_header.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<ScaffoldState>();

    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous.userProfile != current.userProfile,
      builder: (context, state) {
        if (state.userProfile == UserProfile.empty()) {
          context.read<AppBloc>().state.user ?? context.read<ProfileCubit>().getUserProfile();
        }
        return Scaffold(
          resizeToAvoidBottomInset: false,
          key: globalKey,
          endDrawer: ProfileDrawer(),
          appBar: AppBar(
            centerTitle: false,
            title: AutoSizeText(
              "${state.userProfile.display_name}",
              style: Theme.of(context).textTheme.headlineSmall?.apply(color: Theme.of(context).colorScheme.onBackground),
              textAlign: TextAlign.center,
            ),
            leading: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                padding: EdgeInsets.all(5),
                child: Icon(
                  FontAwesome.arrow_left_long,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => globalKey.currentState!.openEndDrawer(),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Badge(
                      badgeContent: Text("3", style: Theme.of(context).textTheme.labelLarge?.apply(color: Theme.of(context).colorScheme.background)),
                      child: Icon(
                        FontAwesome.bars,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            backgroundColor: Theme.of(context).colorScheme.background,
            elevation: 0,
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                  child: ProfileSnapshot(
                    avatarOnTap: () {
                      context.read<ProfileCubit>().changeProfileUrl();
                    },
                    avatar: state.userProfile.avatar,
                    daysInARow: state.userProfile.days_logged_in_a_row,
                    fit_credits: state.userProfile.fit_credits,
                    socialPoints: state.userProfile.social_points,
                  ),
                ),
                Divider(height: 1, color: Theme.of(context).colorScheme.onBackground),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileFeaturedUserStatistics(statisticValue: "4.4", statisticMeasurement: "km", subtitle: "Distance Avg"),
                      FeaturedStatisticDivider(),
                      ProfileFeaturedUserStatistics(statisticValue: "3,000", statisticMeasurement: null, subtitle: "Distance Avg"),
                      FeaturedStatisticDivider(),
                      ProfileFeaturedUserStatistics(statisticValue: "800", statisticMeasurement: "cal", subtitle: "Calories Avg"),
                    ],
                  ),
                ),
                Container(height: 10, color: Theme.of(context).colorScheme.onBackground.withOpacity(.02)),
                UserProfileAchievementsList(),
                Container(height: 10, color: Theme.of(context).colorScheme.onBackground.withOpacity(.02)),
                UserProfileChallengeBadgesList(),
                Container(height: 10, color: Theme.of(context).colorScheme.onBackground.withOpacity(.02)),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  color: Theme.of(context).colorScheme.surface,
                  child: Column(
                    children: [
                      ListHeader(
                        title: "Friend Group",
                        subtitle: "(2nd place)",
                        onTap: () => GoRouter.of(context).push("/friendship"),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: state.userProfile.friends == null || state.userProfile.friends!.isEmpty
                            ? []
                            : state.userProfile.friends!
                                .map(
                                  (e) => FriendshipProfileCard(
                                    colorTheme: Theme.of(context).colorScheme.primary,
                                    position: "1st",
                                    username: e.display_name,
                                    avatar: e.avatar,
                                  ),
                                )
                                .toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40)
              ],
            ),
          ),
        );
      },
    );
  }
}

class FeaturedStatisticDivider extends StatelessWidget {
  const FeaturedStatisticDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: VerticalDivider(color: Colors.black),
    );
  }
}
