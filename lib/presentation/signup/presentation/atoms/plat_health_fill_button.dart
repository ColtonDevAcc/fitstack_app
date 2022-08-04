import 'dart:io';

import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';

class PlatHealthFillButton extends StatelessWidget {
  const PlatHealthFillButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool platform = Platform.isAndroid;
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.healthData != current.healthData,
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<SignupCubit>(context)
                .healthDataChanged([HealthDataType.WEIGHT, HealthDataType.HEIGHT]);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * .05,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  platform ? 'assets/app/icons/googleFit.png' : 'assets/app/icons/healthKit.png',
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Text(
                  "Fill with ${platform ? "Google Fit" : "Apple Health"}",
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.surface),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
