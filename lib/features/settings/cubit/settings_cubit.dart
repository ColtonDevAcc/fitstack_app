import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState(theme: {}));

  void changeTheme({required Map<String, ThemeData> theme}) {
    emit(state.copyWith(theme: theme));
  }
}
