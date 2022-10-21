import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                runAlignment: WrapAlignment.spaceBetween,
                children: FlexScheme.values.map(
                  (e) {
                    return e.name != "custom"
                        ? Theme(
                            data: FlexThemeData.light(scheme: FlexScheme.values.where((element) => element.name == e.name).first),
                            child: Builder(
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
                                    height: 100,
                                    width: 100,
                                    child: Center(
                                      child: Text(
                                        e.name,
                                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Container();
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
