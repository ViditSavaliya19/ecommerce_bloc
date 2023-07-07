import 'package:ecommerce_bloc/config/api_helper.dart';
import 'package:ecommerce_bloc/data/model/product_model.dart';

class ProductRepository {
  static final repo = ProductRepository._();

  List<ProductModel>? productList = [];
  List<ProductModel> cartList = [];
  double totalAmount=0;

  ProductRepository._();

  Future<List<ProductModel>?> getProduct() async {
    productList = await ApiHelper.helper.getProductDataApi();
    return productList;
  }

  void addCartProduct(ProductModel productModel) {
    cartList.add(productModel);
    totalAmountCart();
  }

  void addQaUpdate(int index, ProductModel productModel) {
    if (productModel.qa! > 0) {
      cartList[index] = productModel;
    } else {
      cartList.removeAt(index);
    }
    totalAmountCart();

  }

  void totalAmountCart()
  {
    totalAmount=0;
    for(int i=0;i<cartList.length;i++)
      {
        totalAmount=totalAmount+cartList[i].price!;
      }

  }
}
