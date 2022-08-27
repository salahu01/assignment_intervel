import 'package:assignment_intervel/model/drink_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class InitialState extends HomeState {
  @override
  List<Object> get props => [];
}
class LoadingState extends HomeState {
  @override
  List<Object> get props => [];
}
class LoadedState extends HomeState {
  LoadedState(this.drinks);
  
  final List<DrinkModel> drinks;
  
  @override
  List<Object> get props => [drinks];
}
class ErrorState extends HomeState {
  @override
  List<Object> get props => [];
}