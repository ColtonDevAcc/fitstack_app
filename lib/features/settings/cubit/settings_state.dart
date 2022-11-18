part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final Map<String, ThemeData> theme;

  const SettingsState({required this.theme});

  @override
  List<Object> get props => [theme];

  SettingsState copyWith({Map<String, ThemeData>? theme}) {
    return SettingsState(theme: theme ?? this.theme);
  }
}
