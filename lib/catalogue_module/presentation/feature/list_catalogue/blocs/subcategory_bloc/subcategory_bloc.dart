import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repositories/list_products_by_subcategory_provider.dart';
import '../../../../../domain/models/products_by_subcategory_model.dart';
import 'subcategory_event.dart';
import 'subcategory_state.dart';

class SubcategoryItemsBloc
    extends Bloc<SubcategoryItemsEvent, SubcategoryItemsState> {
  ListProductsBySubCategoryProvider _listProductsBySubCategoryProvider =
      ListProductsBySubCategoryProvider();

  SubcategoryItemsBloc() : super(SubcategoryItemsLoading());

  @override
  Stream<SubcategoryItemsState> mapEventToState(
      SubcategoryItemsEvent event) async* {
    if (event is FetchProductsBySubcategory) {
      yield SubcategoryItemsLoading();

      final dataResponse =
          await _listProductsBySubCategoryProvider.listProductsBySubCategory(
        searchKey: event.searchKey,
        subcategoryId: event.subcategoryId,
        categoryId:event.categoryId,
        pincode: event.pincode,
        SortByPrice: event.SortByPrice

        
      );

      if (dataResponse.hasData) {
        CustomerPoducts? customerPoducts =
            CustomerPoducts.fromJson(dataResponse.data['customerPoducts']);

        if (customerPoducts.totalCount != null) {
          if (customerPoducts.totalCount != 0) {
            yield SubcategoryItemsLoaded(
              products: customerPoducts.products ?? [],
            );
          } else {
            yield SubcategoryItemsLoadingFailed(errorMessage: "No data");
          }
        } else {
          yield SubcategoryItemsLoadingFailed(errorMessage: "No data");
        }
      } else {
        yield SubcategoryItemsLoadingFailed(
          errorMessage: dataResponse.error,
        );
      }
    } else if (event is ClearProductsBySubcategory) {
      yield SubcategoryItemsLoading();
      yield SubcategoryItemsLoaded(products: []);
    }
  }
}
