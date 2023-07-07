import '../../../data/model/product_model.dart';

abstract class CartEvent {}


class AddCartProductEvent extends CartEvent{
  ProductModel productModel=ProductModel();

  AddCartProductEvent(this.productModel);
}


class IncrementQaEvent extends CartEvent {
  ProductModel productModel = ProductModel();
  int index;

  IncrementQaEvent(this.productModel, this.index);
}

class DecrementQaEvent extends CartEvent {
  ProductModel productModel = ProductModel();
  int index;

  DecrementQaEvent(this.productModel, this.index);
}


