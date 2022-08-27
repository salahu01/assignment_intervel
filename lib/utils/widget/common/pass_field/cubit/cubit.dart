import 'package:bloc/bloc.dart';

class AuthPassCubit extends Cubit<bool> {
  AuthPassCubit() : super(true);
  void changeShow() => emit(state == true ? false : true);
}
