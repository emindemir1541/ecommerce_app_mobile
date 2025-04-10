import 'package:ecommerce_app_mobile/presentation/authentication/bloc/user_event.dart';
import 'package:ecommerce_app_mobile/presentation/authentication/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState()) {
    on<AddName>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
    on<AddSurname>((event, emit) {
      emit(state.copyWith(surname: event.surname));
    });
    on<AddEmail>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<AddPassword>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<AddPhoneNo>((event, emit) {
      emit(state.copyWith(phoneNo: event.phoneNo));
    });
  }
}
