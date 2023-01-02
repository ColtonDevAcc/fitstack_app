import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'fs_text_field_state.dart';

class FsTextFieldCubit extends Cubit<FsTextFieldState> {
  FsTextFieldCubit() : super(const FsTextFieldState(iconToggled: false));

  void toggleIcon() {
    emit(state.copyWith(iconToggled: !state.iconToggled));
  }
}
