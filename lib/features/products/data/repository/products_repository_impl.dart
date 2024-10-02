import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/products/data/data_source/remote/product_remote_data_source.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:ecommerce/features/products/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource _remoteDataSource;

  ProductsRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      final productsResponse = await _remoteDataSource.getProducts();
      return Right(productsResponse.data);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
