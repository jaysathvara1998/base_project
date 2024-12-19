import 'dart:convert';

import 'package:base_project/core/errors/failure.dart';
import 'package:base_project/core/network/api_client.dart';
import 'package:base_project/core/network/api_constant.dart';
import 'package:base_project/features/product/data/models/product_model.dart';
import 'package:base_project/features/product/domain/repositories/product_repository.dart';
import 'package:fpdart/fpdart.dart';

class ProductRepositoryImpl implements ProductRepository {
  ApiClient apiClient = ApiClient();

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts(
      {required int offset, required int limit}) async {
    try {
      final response = await apiClient.get(
        ApiConstants.products,
        params: {
          'offset': offset,
          'limit': limit,
        },
      );
      final List<dynamic> parsed = response.data;
      final products = parsed.map((json) => ProductModel.fromJson(json)).toList();
      // final products = ProductModel.fromJson(response.data);

      return Right(products);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch products.'));
    }
  }
}
