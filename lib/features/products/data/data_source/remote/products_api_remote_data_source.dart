import 'package:dio/dio.dart';
import 'package:ecommerce/core/api_constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/products/data/data_source/remote/product_remote_data_source.dart';
import 'package:ecommerce/features/products/data/models/products_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRemoteDataSource)
class ProductsAPIRemoteDataSource extends ProductsRemoteDataSource {
  final Dio _dio;

  ProductsAPIRemoteDataSource(this._dio);
  @override
  Future<ProductsResponse> getProducts() async {
    try {
      final response = await _dio.get(APIConstants.productsEndpoint);
      return ProductsResponse.fromJson(response.data);
    } catch (_) {
      throw const RemoteException();
    }
  }
}
