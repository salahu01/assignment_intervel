import 'package:assignment_intervel/model/drink_model.dart';
import 'package:assignment_intervel/services/get_drinks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.getDrinks,required this.text}) : super(InitialState()) {
    getData();
  }

  final GetDrinks getDrinks;
  final String text;

  void getData() async {
    try {
      emit(LoadingState());
      final List<DrinkModel> drinks = await getDrinks.getData(text: text);
      emit(LoadedState(drinks));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
