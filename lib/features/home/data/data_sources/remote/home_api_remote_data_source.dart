import 'package:dio/dio.dart';
import 'package:ecommerce/core/api_constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/home/data/models/brands_response/brands_response.dart';
import 'package:ecommerce/features/home/data/models/categories_response/categories_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeAPIRemoteDataSource implements HomeRemoteDataSource {
  final Dio _dio;
  HomeAPIRemoteDataSource(this._dio);
  @override
  Future<BrandsResponse> getBrands() async {
    try {
      final response = await _dio.get(APIConstants.brandsEndpoint);
      final brandsResponse = BrandsResponse.fromJson(response.data);

      return brandsResponse;
    } catch (exception) {
      throw const RemoteException();
    }
  }

  @override
  Future<CategoriesResponse> getCategories() async {
    try {
      final response = await _dio.get(APIConstants.categoriesEndpoint);
      final categoryResponse = CategoriesResponse.fromJson(response.data);

      return categoryResponse;
    } catch (exception) {
      throw const RemoteException();
    }
  }
}
