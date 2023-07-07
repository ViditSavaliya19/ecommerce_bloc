import 'package:ecommerce_bloc/data/model/product_model.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_bloc.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ProductListView extends StatelessWidget {
  List<ProductModel> pList = [];

  ProductListView(this.pList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
        itemCount: pList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  "${pList[index].image}",
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 45.w,
                      child: Text(
                        "${pList[index].title}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "\$",
                          style: TextStyle(
                              color: Colors.orange.shade900, fontSize: 15),
                        ),
                        Text(
                          "${pList[index].price}",
                          style: TextStyle(
                              color: Colors.orange.shade900,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.greenAccent.shade700),
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        pList[index].category.toString().substring(9),
                        style: TextStyle(
                            color: Colors.green.shade900, fontSize: 10),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    context.read<ProductBloc>().add(AddCartProductEvent(pList[index]));
                  },
                  icon: Icon(Icons.add_shopping_cart),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
