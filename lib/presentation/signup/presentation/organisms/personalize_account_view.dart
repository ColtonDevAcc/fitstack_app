import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Personalize_Account_View extends StatelessWidget {
  const Personalize_Account_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            return AppBar(
              title: state.index == 1
                  ? Text(
                      "Personalization",
                      style: Theme.of(context).textTheme.titleMedium!
                        ..copyWith(color: Theme.of(context).colorScheme.primary),
                    )
                  : null,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: GestureDetector(
                onTap: () => BlocProvider.of<SignupCubit>(context).changePage(state.index - 1),
                child: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Theme.of(context).colorScheme.onBackground,
                  size: 20,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
