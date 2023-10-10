// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'HomeBloc.dart';

enum HomeStatus {
  initial,
  success,
  error,
  loading,
  /*
  sledShowInitial,
  sledShowSuccess,
  sledShowError,
  sledShowLoading
  */
}

extension CategoryStatusX on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isSuccess => this == HomeStatus.success;
  bool get isError => this == HomeStatus.error;
  bool get isLoading => this == HomeStatus.loading;
  /*
  bool get isSledShowInitial => this == HomeStatus.sledShowInitial;
  bool get isSledShowSuccess => this == HomeStatus.sledShowSuccess;
  bool get isSledShowError => this == HomeStatus.sledShowError;
  bool get isSledShowLoading => this == HomeStatus.sledShowLoading;
  */
}

class HomeState extends Equatable {
  const HomeState({
    this.selectFoodIndex = 0,
    this.showIndex = 0,
    this.status = HomeStatus.initial,
    this.error,
    List<FoodModel>? foods,
  }) : foods = foods ?? const [];

  final List<FoodModel> foods;
  final HomeStatus status;
  final String? error;
  final int? selectFoodIndex;
  final int? showIndex;

  @override
  List<Object?> get props => [status, foods, error, selectFoodIndex, showIndex];

  HomeState copyWith(
      {List<FoodModel>? foods,
      HomeStatus? status,
      String? error,
      int? selectFoodIndex,
      int? showIndex}) {
    return HomeState(
      foods: foods ?? this.foods,
      status: status ?? this.status,
      error: error ?? this.error,
      selectFoodIndex: selectFoodIndex ?? this.selectFoodIndex,
      showIndex: showIndex ?? this.showIndex,
    );
  }
}
