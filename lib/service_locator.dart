import 'package:dogs_images/modules/dashboard/infra/datasources/dogs/dogs_datasource.dart';
import 'package:dogs_images/modules/dashboard/infra/datasources/dogs/dogs_datasource_impl.dart';
import 'package:dogs_images/modules/dashboard/infra/datasources/dogs/dogs_datasource_mock.dart';
import 'package:get_it/get_it.dart';

GetIt? _injector;

GetIt get sl {
  _injector ??= GetIt.instance;
  return _injector!;
}

Future<void> registerServices({bool isTest = false}) async {
  if (isTest) {
    sl.registerLazySingleton<DogsDataSource>(() => DogsDataSourceMock());
  } else {
    sl.registerLazySingleton<DogsDataSource>(() => DogsDataSourceImpl());
  }
}
