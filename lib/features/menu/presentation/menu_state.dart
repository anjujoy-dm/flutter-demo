import '../domain/menu_item.dart';

// Base state
abstract class MenuState {}

// 1. Initial / Loading state (show spinner)
class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

// 2. Success state (contains the list of food items)
class MenuLoaded extends MenuState {
  final List<MenuItem> items;
  MenuLoaded(this.items);
}

// 3. Error state (show error text)
class MenuError extends MenuState {
  final String message;
  MenuError(this.message);
}
