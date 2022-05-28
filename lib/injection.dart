import 'package:get_it/get_it.dart';

import 'features/main/presentation/bloc/page_manager/page_manager_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async => appDependencies();

Future<void> appDependencies() async {
  serviceLocator.registerFactory(
    () => PageManagerBloc(),
  );
}
