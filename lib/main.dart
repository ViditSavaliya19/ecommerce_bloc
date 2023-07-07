import 'package:device_preview/device_preview.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_bloc.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_event.dart';
import 'package:ecommerce_bloc/presentation/dashboard/cart_screen.dart';
import 'package:ecommerce_bloc/presentation/dashboard/dash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProductBloc()..add(ProductLoadStartEvent()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => DashScreen(),
              'cart': (context) => CartScreen(),
            },
          ),
      ),
    ),
  );
}
