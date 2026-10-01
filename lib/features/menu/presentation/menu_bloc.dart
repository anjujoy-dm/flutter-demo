import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../domain/menu_repository.dart';
import 'menu_event.dart';
import 'menu_state.dart';

@injectable
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc(this._repository) : super(MenuInitial()) {
    on<MenuRequested>(_onMenuRequested);
  }

  final MenuRepository _repository;

  Future<void> _onMenuRequested(
    MenuRequested event,
    Emitter<MenuState> emit,
  ) async {
    emit(MenuLoading());
    try {
      emit(MenuLoaded(await _repository.getMenuItems()));
    } catch (error) {
      emit(MenuError('Could not load menu: $error'));
    }
  }
}