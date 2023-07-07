import '../../../data/model/product_model.dart';

abstract class ProductEvent {}

class ProductLoadStartEvent extends ProductEvent {}

class ProductLoadedEvent extends ProductEvent {
  List<ProductModel> productList = [];

  ProductLoadedEvent(this.productList);
}

class ProductLoadErrorEvent extends ProductEvent {
  String error;

  ProductLoadErrorEvent(this.error);
}
class AddCartProductEvent extends ProductEvent{
  ProductModel productModel=ProductModel();

  AddCartProductEvent(this.productModel);
}
