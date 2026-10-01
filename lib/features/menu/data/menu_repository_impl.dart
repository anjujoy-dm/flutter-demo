import 'package:injectable/injectable.dart';

import '../domain/menu_item.dart';
import '../domain/menu_repository.dart';
import 'menu_remote_data_source.dart';

@LazySingleton(as: MenuRepository)
class MenuRepositoryImpl implements MenuRepository {
  MenuRepositoryImpl(this._remoteDataSource);

  final MenuRemoteDataSource _remoteDataSource;

  @override
  Future<List<MenuItem>> getMenuItems() =>
      _remoteDataSource.fetchMenuItems();
}
