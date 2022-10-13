import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit() : super(MainViewState(pageIndex: 0));

  void onPageChanged({pageIndex: int}) {
    emit(state.copyWith(pageIndex: pageIndex));
  }
}
