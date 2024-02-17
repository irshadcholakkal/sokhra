import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repositories/list_featured_products_provider.dart';
import '../../../../../domain/models/products_by_subcategory_model.dart';

part 'recent_ordered_products_event.dart';

part 'recent_ordered_products_state.dart';

class RecentOrderedProductsBloc
    extends Bloc<RecentOrderedProductsEvent, RecentOrderedProductsState> {
  final _recentOrderedProductsProvider = ListFeaturedProductsProvider();

  RecentOrderedProductsBloc() : super(RecentOrderedProductsLoading());

  @override
  Stream<RecentOrderedProductsState> mapEventToState(
    RecentOrderedProductsEvent event,
  ) async* {
    if (event is FetchRecentOrderedProducts) {
      yield RecentOrderedProductsLoading();

      final dataResponse =
          await _recentOrderedProductsProvider.getRecentOrderedProducts();

      if (dataResponse.hasData) {
        final productList = CustomerPoducts.fromJson(
          dataResponse.data['customerPoducts'],
        );

        yield RecentOrderedProductsLoaded(products: productList.products ?? []);
      } else {
        yield RecentOrderedProductsLoadingFailed(
          message: dataResponse.error ?? "",
        );
      }
    }
  }
}
