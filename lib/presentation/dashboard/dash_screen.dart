import 'package:ecommerce_bloc/config/api_helper.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_bloc.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_event.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_state.dart';
import 'package:ecommerce_bloc/presentation/dashboard/widget/productList_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ProductBloc,ProductState>(
          builder: (context, state) {
            if (state is ProductLoadState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoadedState) {
              return ProductListView(state.productList);
            } else if (state is ProductErrorState) {
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
