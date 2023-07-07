import '../../../data/model/product_model.dart';

abstract class CartState
{

}
class InitialState extends CartState
{

}

class AddCartState extends CartState {
  List<ProductModel> cartList = [];
  double totlaAmount;
  AddCartState(this.cartList,this.totlaAmount);
}
class IncrementQaState extends CartState
{
  double totlaAmount;
  List<ProductModel> cartList = [];
  IncrementQaState(this.cartList,this.totlaAmount);
}
class DecrementQaState extends CartState
{
  double totlaAmount;
  List<ProductModel> cartList = [];
  DecrementQaState(this.cartList,this.totlaAmount);
}


