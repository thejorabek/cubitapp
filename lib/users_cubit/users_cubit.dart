import 'package:cubitapp/users_cubit/users_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(const UsersInitial());

  Future<void> getUsers() async {
    try {
      emit(const UsersInitial());
      await Future.delayed(Duration(seconds: 2));
      final res = await Future.value(['Bir', 'Ikki', 'Uch', 'Tort']);
      emit(UsersComplete(res));
    } catch (e) {
      emit(UsersError('Malumot kelmay qoldi'));
    }
  }
}
