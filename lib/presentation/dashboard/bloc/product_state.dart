import 'package:ecommerce_bloc/data/model/product_model.dart';

abstract class ProductState {}

class ProductLoadState extends ProductState{

}
class ProductLoadedState extends ProductState {
  List<ProductModel> productList = [];

  ProductLoadedState(this.productList);
}

class ProductErrorState extends ProductState {
  String error;

  ProductErrorState(this.error);
}
class AddCartState extends ProductState {
  List<ProductModel> cartList = [];
  AddCartState(this.cartList);
}
