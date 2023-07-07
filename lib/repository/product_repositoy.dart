import 'package:ecommerce_bloc/config/api_helper.dart';
import 'package:ecommerce_bloc/data/model/product_model.dart';

class ProductRepository {
  static final repo = ProductRepository._();

  List<ProductModel>? productList = [];
  List<ProductModel> cartList = [];

  ProductRepository._();

  Future<List<ProductModel>?> getProduct() async {
    productList = await ApiHelper.helper.getProductDataApi();
    return productList;
  }

  void addCartProduct(ProductModel productModel)
  {
      cartList.add(productModel);
  }

}
