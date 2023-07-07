import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_event.dart';
import 'package:ecommerce_bloc/presentation/dashboard/bloc/product_state.dart';
import 'package:ecommerce_bloc/repository/product_repositoy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>
{
  ProductBloc():super(ProductLoadState()){
   on<ProductLoadStartEvent>((event, emit) async {
     emit.call(ProductLoadState());
     try{
       await ProductRepository.repo.getProduct();
       emit.call(ProductLoadedState(ProductRepository.repo.productList!));
     }catch(e)
     {
       emit.call(ProductErrorState(e.toString()));
     }
   });


  }

}
