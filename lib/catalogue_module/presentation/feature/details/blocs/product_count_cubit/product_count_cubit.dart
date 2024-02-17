import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_count_state.dart';

class ProductCountCubit extends Cubit<ProductCountState> {
  ProductCountCubit() : super(ProductCountInitial());

  int _count = 1;
  int get count => _count;

  increment() {
    _count = _count + 1;
    emit(ProductCountLoaded(quantity: count));
  }

  decrement() {
    _count > 1 ? _count = _count - 1 : _count = 0;
    emit(ProductCountLoaded(quantity: count));
  }

  setValue({required int quantity}) {
    _count = quantity;
    emit(ProductCountLoaded(quantity: count));
  }
}
