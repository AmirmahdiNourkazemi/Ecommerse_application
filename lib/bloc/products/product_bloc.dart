import 'package:bloc/bloc.dart';
import 'package:mobile_shop/bloc/products/product_event.dart';
import 'package:mobile_shop/bloc/products/product_state.dart';
import 'package:mobile_shop/data/repository/basket_item_repository.dart';
import 'package:mobile_shop/data/repository/product_detail_repository.dart';

import '../../data/model/basket_item.dart';
import '../../di/di.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductDetailInitState()) {
    final IDetailRepository _productRepository = locator.get();
    final IBasketItemRepository _basketItemRepository = locator.get();
    on<ProductGetInitializedData>((event, emit) async {
      emit(ProductDetailLoadingState());
      var getProductImage =
          await _productRepository.getProductImage(event.productId);
      var getProductVarientType =
          await _productRepository.getProductVarientType(event.productId);
      var getProductCategory =
          await _productRepository.getProductCategory(event.categoryId);
      var getProperties =
          await _productRepository.getProperties(event.productId);
      emit(ProductDetailResponseState(getProductImage, getProductVarientType,
          getProductCategory, getProperties));
    });
    on<AddProductToBasket>(
      (event, emit) {
        var item = BasketItem(
            event.products.collectionId,
            event.products.discount_price,
            event.products.id,
            event.products.name,
            event.products.price,
            event.products.thumbnail);
        _basketItemRepository.addProductToBasket(item);
      },
    );
  }
}
