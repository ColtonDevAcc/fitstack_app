// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit() : super(const MainViewState(pageIndex: 0));

  void onPageChanged({required int pageIndex}) {
    emit(state.copyWith(pageIndex: pageIndex));
  }
}
