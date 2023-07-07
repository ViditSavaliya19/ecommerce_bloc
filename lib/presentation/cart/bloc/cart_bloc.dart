import 'package:ecommerce_bloc/presentation/cart/bloc/cart_event.dart';
import 'package:ecommerce_bloc/presentation/cart/bloc/cart_state.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/product_repositoy.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(InitialState()) {
    on<AddCartProductEvent>((event, emit) {
      ProductRepository.repo.addCartProduct(event.productModel);
      emit.call(AddCartState(
          ProductRepository.repo.cartList, ProductRepository.repo.totalAmount));
    });

    on<IncrementQaEvent>((event, emit) {
      event.productModel.qa = event.productModel.qa! + 1;
      ProductRepository.repo.addQaUpdate(event.index, event.productModel);
      emit.call(IncrementQaState(
          ProductRepository.repo.cartList, ProductRepository.repo.totalAmount));
    });
    on<DecrementQaEvent>((event, emit) {
      event.productModel.qa = event.productModel.qa! - 1;
      ProductRepository.repo.addQaUpdate(event.index, event.productModel);
      emit.call(DecrementQaState(
          ProductRepository.repo.cartList, ProductRepository.repo.totalAmount));
    });
  }
}
