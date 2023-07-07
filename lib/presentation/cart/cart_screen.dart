import 'package:ecommerce_bloc/config/payment_helper.dart';
import 'package:ecommerce_bloc/presentation/cart/bloc/cart_bloc.dart';
import 'package:ecommerce_bloc/presentation/cart/bloc/cart_state.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_bloc.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_event.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../data/model/product_model.dart';
import 'bloc/cart_event.dart';

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
          title: Text(
            "Shop Now",
            style: TextStyle(color: Colors.orange),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 2,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'cart');
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ))
          ],
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is AddCartState) {
              return buildListView(state.cartList, state.totlaAmount);
            } else if (state is IncrementQaState) {
              return buildListView(state.cartList, state.totlaAmount);
            } else if (state is DecrementQaState) {
              return buildListView(state.cartList, state.totlaAmount);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Widget buildListView(List<ProductModel> l1, double amount) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: l1.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      "${l1[index].image}",
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
                          child: Text("${l1[index].title}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(fontSize: 18)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "\$",
                              style: GoogleFonts.poppins(
                                  color: Colors.orange.shade900, fontSize: 15),
                            ),
                            Text(
                              "${l1[index].price}",
                              style: GoogleFonts.poppins(
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
                            border:
                                Border.all(color: Colors.greenAccent.shade700),
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            l1[index].category.toString().substring(9),
                            style: GoogleFonts.poppins(
                                color: Colors.green.shade900, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(IncrementQaEvent(l1[index], index));
                      },
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    Text(
                      "${l1[index].qa}",
                    ),
                    IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(DecrementQaEvent(l1[index], index));
                      },
                      icon: Icon(Icons.remove_circle_outline),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          width: 100.w,
          height: 70,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 5)
          ]),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Amount",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Total Qa :",
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${l1.length}",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange.shade900),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Container(
                height: 60,
                width: 100,
                color: Colors.orange.shade900,
                alignment: Alignment.center,
                child: Text(
                  "\$ $amount",
                  style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {

                    PaymentHelper.payment.setPayment(amount);
                },
                child: Text(
                  "Check Out",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
