part of 'main_view_cubit.dart';

class MainViewState extends Equatable {
  final int pageIndex;
  const MainViewState({required this.pageIndex});

  @override
  List<Object> get props => [pageIndex];

  MainViewState copyWith({final int? pageIndex}) {
    return MainViewState(pageIndex: pageIndex ?? this.pageIndex);
  }
}
