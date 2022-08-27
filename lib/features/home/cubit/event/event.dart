import 'dart:developer';
import 'package:assignment_intervel/features/home/cubit/cubit.dart';
import 'package:assignment_intervel/model/drink_model.dart';
import 'package:assignment_intervel/services/get_drinks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.getDrinks}) : super(InitialState()) {
    getTrendingMovies();
  }

  final GetDrinks getDrinks;

  void getTrendingMovies() async {
    try {
      emit(LoadingState());
      final List<DrinkModel> drinks = await getDrinks.getData(text: 'rum');
      emit(LoadedState(drinks));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
