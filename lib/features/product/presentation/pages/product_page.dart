import 'package:base_project/core/widgets/app_text.dart';
import 'package:base_project/core/widgets/app_wrapper.dart';
import 'package:base_project/features/product/data/repositories/product_repository_impl.dart';
import 'package:base_project/features/product/presentation/bloc/product_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ScrollController _scrollController;
  late ProductBloc _userBloc;
  bool isPaginating = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _userBloc = ProductBloc(ProductRepositoryImpl())
      ..add(FetchProductEvent(offset: 1, limit: 11));

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !isPaginating) {
        final currentState = _userBloc.state;
        if (currentState is ProductLoaded && currentState.hasMore) {
          isPaginating = true; // Prevent multiple API calls
          _userBloc.add(LoadMoreProductEvent(
            offset: currentState.offset + 10,
            limit: 10,
          ));
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _userBloc,
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoaded) {
            isPaginating = false;
          }
          return AppWrapper(
            isLoading: state is ProductLoading && state is! ProductLoaded,
            child: _buildContent(state),
          );
        },
      ),
    );
  }

  Widget _buildContent(ProductState state) {
    if (state is ProductLoaded) {
      return ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.all(16),
        itemCount: state.hasMore && isPaginating
            ? state.products.length + 1
            : state.products.length,
        itemBuilder: (context, index) {
          if (index == state.products.length) {
            return const Center(child: CircularProgressIndicator());
          }
          final product = state.products[index];
          return Card(
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    image: DecorationImage(
                      image: NetworkImage(product.images?.firstOrNull ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 100,
                  width: 80,
                  child: Image.network(product.images?.firstOrNull ?? '',
                      height: 100, errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.error);
                  }),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.title(text: product.title ?? '', maxLines: 2),
                      SizedBox(height: 8),
                      AppText.caption(
                          text: product.description ?? '', maxLines: 2),
                    ],
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
          );
        },
      );
    } else if (state is ProductError) {
      return Center(
        child: Text(
          state.message,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }
    return const Center(
      child: Text('No users found.'),
    );
  }
}
