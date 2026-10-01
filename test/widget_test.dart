// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project/app/injection.dart';
import 'package:mini_project/features/menu/domain/menu_item.dart';
import 'package:mini_project/features/menu/domain/menu_repository.dart';
import 'package:mini_project/features/menu/presentation/menu_bloc.dart';

import 'package:mini_project/main.dart';

void main() {
  setUp(() async {
    await getIt.reset();
    getIt.registerFactory<MenuBloc>(
      () => MenuBloc(_FakeMenuRepository()),
    );
  });

  tearDown(() async {
    await getIt.reset();
  });

  testWidgets('loads menu items through the menu bloc', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Test Cheeseburger'), findsOneWidget);
    expect(find.text('\$9.99'), findsOneWidget);
  });
}

class _FakeMenuRepository implements MenuRepository {
  @override
  Future<List<MenuItem>> getMenuItems() async => const [
    MenuItem(id: '1', name: 'Test Cheeseburger', price: 9.99),
  ];
}
