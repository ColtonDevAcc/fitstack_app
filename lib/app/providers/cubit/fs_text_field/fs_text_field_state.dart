part of 'fs_text_field_cubit.dart';

class FsTextFieldState extends Equatable {
  final bool iconToggled;
  const FsTextFieldState({required this.iconToggled});

  @override
  List<Object> get props => [iconToggled];

  FsTextFieldState copyWith({bool? iconToggled}) {
    return FsTextFieldState(iconToggled: iconToggled ?? this.iconToggled);
  }
}
