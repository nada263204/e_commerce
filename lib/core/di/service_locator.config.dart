// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:ecommerce/core/di/app_module.dart' as _i27;
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i11;
import 'package:ecommerce/features/auth/data/data_source/local/auth_shared_pref_local_data_source.dart'
    as _i12;
import 'package:ecommerce/features/auth/data/data_source/remote/auth_api_remote_data_source.dart'
    as _i6;
import 'package:ecommerce/features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i5;
import 'package:ecommerce/features/auth/data/repository/auth_repository_impl.dart'
    as _i18;
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart'
    as _i17;
import 'package:ecommerce/features/auth/domain/use_cases/login.dart' as _i22;
import 'package:ecommerce/features/auth/domain/use_cases/register.dart' as _i23;
import 'package:ecommerce/features/auth/presentation/auth_cubit/auth_cubit.dart'
    as _i24;
import 'package:ecommerce/features/home/data/data_sources/remote/home_api_remote_data_source.dart'
    as _i8;
import 'package:ecommerce/features/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i7;
import 'package:ecommerce/features/home/data/repository/home_repository_impl.dart'
    as _i14;
import 'package:ecommerce/features/home/domain/repository/home_repository.dart'
    as _i13;
import 'package:ecommerce/features/home/domain/use_cases/get_brands.dart'
    as _i19;
import 'package:ecommerce/features/home/domain/use_cases/get_categories.dart'
    as _i20;
import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart'
    as _i25;
import 'package:ecommerce/features/products/data/data_source/remote/product_remote_data_source.dart'
    as _i9;
import 'package:ecommerce/features/products/data/data_source/remote/products_api_remote_data_source.dart'
    as _i10;
import 'package:ecommerce/features/products/data/repository/products_repository_impl.dart'
    as _i16;
import 'package:ecommerce/features/products/domain/repository/products_repository.dart'
    as _i15;
import 'package:ecommerce/features/products/domain/use_cases/get_products_use_case.dart'
    as _i21;
import 'package:ecommerce/features/products/presentation/cubit/products_cubit.dart'
    as _i26;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i3.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i4.Dio>(() => registerModule.dio);
    gh.singleton<_i5.AuthRemoteDataSource>(
        () => _i6.AuthApiDataRemoteSource(gh<_i4.Dio>()));
    gh.lazySingleton<_i7.HomeRemoteDataSource>(
        () => _i8.HomeAPIRemoteDataSource(gh<_i4.Dio>()));
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.lazySingleton<_i9.ProductsRemoteDataSource>(
        () => _i10.ProductsAPIRemoteDataSource(gh<_i4.Dio>()));
    gh.singleton<_i11.AuthLocalDataSource>(
        () => _i12.AuthSharedPrefLocalDataSource(gh<_i3.SharedPreferences>()));
    gh.lazySingleton<_i13.HomeRepository>(
        () => _i14.HomeRepositoryImpl(gh<_i7.HomeRemoteDataSource>()));
    gh.lazySingleton<_i15.ProductsRepository>(
        () => _i16.ProductsRepositoryImpl(gh<_i9.ProductsRemoteDataSource>()));
    gh.singleton<_i17.AuthRepository>(() => _i18.AuthRepositoryImpl(
          gh<_i5.AuthRemoteDataSource>(),
          gh<_i11.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i19.GetBrands>(
        () => _i19.GetBrands(gh<_i13.HomeRepository>()));
    gh.lazySingleton<_i20.GetCategories>(
        () => _i20.GetCategories(gh<_i13.HomeRepository>()));
    gh.lazySingleton<_i21.GetProducts>(
        () => _i21.GetProducts(gh<_i15.ProductsRepository>()));
    gh.factory<_i22.Login>(() => _i22.Login(gh<_i17.AuthRepository>()));
    gh.factory<_i23.Register>(() => _i23.Register(gh<_i17.AuthRepository>()));
    gh.singleton<_i24.AuthCubit>(() => _i24.AuthCubit(
          gh<_i22.Login>(),
          gh<_i23.Register>(),
        ));
    gh.factory<_i25.HomeCubit>(() => _i25.HomeCubit(
          gh<_i20.GetCategories>(),
          gh<_i19.GetBrands>(),
        ));
    gh.factory<_i26.ProductsCubit>(
        () => _i26.ProductsCubit(gh<_i21.GetProducts>()));
    return this;
  }
}

class _$RegisterModule extends _i27.RegisterModule {}
