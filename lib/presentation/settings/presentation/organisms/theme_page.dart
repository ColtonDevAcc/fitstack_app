import 'package:FitStack/presentation/settings/cubit/settings_cubit.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: Text("Choose a theme")),
      body: SafeArea(
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(),
              BlocBuilder<SettingsCubit, SettingsState>(
                builder: (context, state) {
                  return Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runAlignment: WrapAlignment.spaceBetween,
                    children: FlexScheme.values.map(
                      (e) {
                        return e.name != "custom"
                            ? Builder(
                                builder: (context) {
                                  ThemeData theme = FlexThemeData.light(scheme: FlexScheme.values.where((element) => element.name == e.name).first);

                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(color: theme.colorScheme.surface),
                                      child: GestureDetector(
                                        onTap: () {
                                          context.read<SettingsCubit>().changeTheme(theme: {"light": theme});
                                        },
                                        child: Column(
                                          children: [
                                            Text(e.name),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(color: theme.colorScheme.primary),
                                                  height: 100,
                                                  width: 25,
                                                  child: Center(
                                                    child: Text(
                                                      "P",
                                                      style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(color: theme.colorScheme.secondary),
                                                  height: 100,
                                                  width: 25,
                                                  child: Center(
                                                    child: Text(
                                                      "S",
                                                      style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSecondary),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(color: theme.colorScheme.tertiary),
                                                  height: 100,
                                                  width: 25,
                                                  child: Center(
                                                    child: Text(
                                                      "OT",
                                                      style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onTertiary),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(color: theme.colorScheme.error),
                                                  height: 100,
                                                  width: 25,
                                                  child: Center(
                                                    child: Text(
                                                      "OE",
                                                      style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onError),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Container();
                      },
                    ).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
