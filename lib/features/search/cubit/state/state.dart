import 'package:assignment_intervel/model/drink_model.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {}

class InitialState extends SearchState {
  @override
  List<Object> get props => [];
}
class LoadingState extends SearchState {
  @override
  List<Object> get props => [];
}
class LoadedState extends SearchState {
  LoadedState(this.drinks);
  
  final List<DrinkModel> drinks;
  
  @override
  List<Object> get props => [drinks];
}
class ErrorState extends SearchState {
  @override
  List<Object> get props => [];
}