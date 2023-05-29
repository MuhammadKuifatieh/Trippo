import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/main/presentation/bloc/page_manager/page_manager_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async => await appDependencies();

Future<void> appDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  //! Features - main
  //blocs
  serviceLocator.registerFactory(
    () => PageManagerBloc(),
  );
}
