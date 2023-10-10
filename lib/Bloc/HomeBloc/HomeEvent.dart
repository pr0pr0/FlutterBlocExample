part of 'HomeBloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetFoodList extends HomeEvent {
  const GetFoodList();

  @override
  List<Object> get props => [];
}

class SelectFood extends HomeEvent {
  final int selectFoodIndex;

  const SelectFood(this.selectFoodIndex);

  @override
  List<Object> get props => [selectFoodIndex];
}

class ShowIndexEvent extends HomeEvent {
  final int index;

  const ShowIndexEvent(this.index);

  @override
  List<Object> get props => [index];
}
