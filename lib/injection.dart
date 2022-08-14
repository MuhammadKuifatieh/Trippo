import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trippo/features/city/data/datasources/get_city_remote_data_source.dart';
import 'package:trippo/features/city/data/datasources/get_places_of_city_remote_data_source.dart';
import 'package:trippo/features/city/data/repositories/city_repository_impl.dart';
import 'package:trippo/features/city/domain/repositories/city_repository.dart';
import 'package:trippo/features/city/domain/usecases/get_city_use_case.dart';
import 'package:trippo/features/city/domain/usecases/get_places_of_city_use_case.dart';
import 'package:trippo/features/city/presentation/bloc/city_bloc.dart';

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
  //! Features - city
    //blocs
      serviceLocator.registerFactory(
        () => CityBloc(
          getCityByIdUseCase: serviceLocator(),
          getPlacesOfCityUseCase: serviceLocator(),
        ),
      );
    //useCases
      serviceLocator.registerLazySingleton(
        () => GetCityUseCase(getCityRepository: serviceLocator()),
      );
      serviceLocator.registerLazySingleton(
        () => GetPlacesOfCityUseCase(getCityRepository: serviceLocator()),
      );

    //repositories
      serviceLocator.registerLazySingleton<GetCityRepository>(
        () => GetCityRepositoryImpl(
          getCityRemoteDataSource: serviceLocator(),
          getPlacesOfCityRemoteDataSource: serviceLocator(),
         
        ),
      );
    //dataSources
      serviceLocator.registerLazySingleton(
        () => GetCityRemoteDataSource(),
      );
      serviceLocator.registerLazySingleton(
        () => GetPlacesOfCityRemoteDataSource(),
      );

}
