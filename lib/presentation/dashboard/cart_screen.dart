import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_bloc.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Shop Now",style: TextStyle(color: Colors.orange),),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 2,
          actions: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, 'cart');
            }, icon: Icon(Icons.shopping_cart,color: Colors.black,))
          ],
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is AddCartState) {
              return ListView.builder(
                itemCount: state.cartList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: Image.network(
                        "${state.cartList[index].image}",
                        height: 80,
                        width: 80,
                      ),
                      title: Text(
                        "${state.cartList[index].title}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
