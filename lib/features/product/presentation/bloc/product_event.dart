part of 'product_bloc.dart';

abstract class ProductEvent {}

class FetchProductEvent extends ProductEvent {
  final int offset;
  final int limit;

  FetchProductEvent({required this.offset, required this.limit});
}

class LoadMoreProductEvent extends ProductEvent {
  final int offset;
  final int limit;

  LoadMoreProductEvent({required this.offset, required this.limit});
}
