import 'package:ecommerce_bloc/config/api_helper.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_bloc.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_event.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_state.dart';
import 'package:ecommerce_bloc/presentation/dashboard/widget/productList_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/product_model.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {

  List<ProductModel> l1=[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
        body: BlocBuilder<ProductBloc,ProductState>(
          builder: (context, state) {
            if (state is ProductLoadState) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (state is ProductLoadedState) {
              l1= state.productList;
              return ProductListView(l1);
            }
            else if (state is ProductErrorState) {
              return Center(
                child: SelectableText("Error => ${state.error}"),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
