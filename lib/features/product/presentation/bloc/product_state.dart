part of 'product_bloc.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {
  final String message;

  ProductLoading({required this.message});
}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  final bool hasMore;
  final int offset;

  ProductLoaded({
    required this.products,
    required this.hasMore,
    required this.offset,
  });
}

class ProductError extends ProductState {
  final String message;
  final List<ProductModel>? existingUsers;

  ProductError(this.message, {this.existingUsers});
}
