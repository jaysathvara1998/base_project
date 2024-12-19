import 'package:base_project/core/errors/failure.dart';
import 'package:base_project/features/product/data/models/product_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductModel>>> getProducts({required int offset, required int limit});
}
