import 'package:base_project/core/constants/app_strings.dart';
import 'package:base_project/features/product/data/models/product_model.dart';
import 'package:base_project/features/product/domain/repositories/product_repository.dart';
import 'package:bloc/bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductInitial()) {
    on<FetchProductEvent>(_onFetchUsers);
    on<LoadMoreProductEvent>(_onLoadMoreUsers);
  }

  Future<void> _onFetchUsers(
      FetchProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading(message: AppStrings.loadingProduct));
    try {
      final response = await productRepository.getProducts(
          offset: event.offset, limit: event.limit);

      response.fold(
        (failure) => emit(ProductError(failure.message)),
        (products) {
          emit(ProductLoaded(
            products: products,
            hasMore: event.offset < event.limit,
            offset: event.offset,
          ));
        },
      );
    } catch (e) {
      emit(ProductError('An unexpected error occurred while fetching users.'));
    }
  }

  Future<void> _onLoadMoreUsers(
      LoadMoreProductEvent event, Emitter<ProductState> emit) async {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;

      if (!currentState.hasMore) return;

      try {
        final response = await productRepository.getProducts(
            offset: event.offset, limit: event.limit);

        response.fold(
          (failure) {
            emit(ProductError(failure.message,
                existingUsers: currentState.products));
          },
          (userData) {
            emit(ProductLoaded(
              products: currentState.products + userData, // Append new users
              hasMore: event.offset < event.limit,
              offset: event.offset,
            ));
          },
        );
      } catch (e) {
        emit(ProductError(
            'An unexpected error occurred while loading more users.',
            existingUsers: currentState.products));
      }
    }
  }
}
