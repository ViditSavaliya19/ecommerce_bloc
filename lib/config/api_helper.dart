import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_bloc/data/model/product_model.dart';

class ApiHelper {
  static final helper = ApiHelper._();

  ApiHelper._();

  Future<List<ProductModel>?> getProductDataApi() async {
    String apiLink = "https://fakestoreapi.com/products";

    Dio dio = Dio();
    var response = await dio.get(apiLink);

      if (response.statusCode == 200) {
        List json = response.data;
        List<ProductModel> productList = json.map((e) => ProductModel.fromJson(e)).toList();
        return productList;
      }
    return null;
  }
}
