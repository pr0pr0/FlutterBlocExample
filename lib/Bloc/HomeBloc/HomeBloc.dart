import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodapp/Data/Model/FoodModel/FoodModel.dart';
import 'package:foodapp/Data/Repository/FoodRepository.dart';
import 'package:foodapp/Helper/Hive/HiveDB.dart';

part 'HomeEvent.dart';
part 'HomeState.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FoodRepository foodRepository;
  HomeBloc({
    required this.foodRepository,
  }) : super(const HomeState()) {
    on<GetFoodList>(_mapGetFoodsEventToState);
    on<SelectFood>(_mapSelectFoodsEventToState);
    on<ShowIndexEvent>(_mapShowIndexEventToState);
  }

  Future<FutureOr<void>> _mapGetFoodsEventToState(
      GetFoodList event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    await HiveDB().getBoxLength("Foods").then((boxLength) async {
      if (boxLength >= 1) {
        await HiveDB().getBoxes('Foods').then((localFoods) {
          emit(
            state.copyWith(
                foods: localFoods.cast<FoodModel>(),
                status: HomeStatus.success),
          );
        });
      }
      await foodRepository
          .getFoodRequested(from: boxLength)
          .then((serverFoods) async {
        emit(
          state.copyWith(
              foods: List.of(state.foods)..addAll(serverFoods),
              status: HomeStatus.success),
        );
        for (var element in serverFoods) {
          HiveDB().addOneBox(element, "Foods");
        }
      }).onError((e, stackTrace) async {
        if (boxLength == 0) {
          emit(
            state.copyWith(status: HomeStatus.error, error: e.toString()),
          );
        }
      });
    });
  }

  FutureOr<void> _mapSelectFoodsEventToState(
      SelectFood event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(
          selectFoodIndex: event.selectFoodIndex),
    );
  }

  FutureOr<void> _mapShowIndexEventToState(
      ShowIndexEvent event, Emitter<HomeState> emit) {
    emit(
      state.copyWith(showIndex: event.index),
    );
  }
}
