import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repositories/list_all_category_provider.dart';
import '../../../../../domain/models/category_model.dart';
import 'list_all_categories_event.dart';
import 'list_all_categories_state.dart';

class ListAllCategoriesBloc
    extends Bloc<ListAllCategoriesEvent, ListAllCategoriesState> {
  ListAllCategoryProvider _listAllCategoryProvider = ListAllCategoryProvider();

  ListAllCategoriesBloc() : super(AllCategoriesLoading());

  @override
  Stream<ListAllCategoriesState> mapEventToState(
    ListAllCategoriesEvent event,
  ) async* {
    if (event is ListAllCategories) {
      yield AllCategoriesLoading();

      final dataResponse = await _listAllCategoryProvider.listAllCategories(
          //pincode: event.pincode,
          );
      print("ListAllCategoryBloc : ${dataResponse.data}");

      if (dataResponse.hasData) {
        final categoryRootModel = CategoryRootModel.fromJson(dataResponse.data);

        if (categoryRootModel.categories != null) {
          yield AllCategoriesLoaded(
            categories: categoryRootModel.categories ?? [],
          );
        } else {
          yield AllCategoriesLoadingFailed();
        }
      } else {
        yield AllCategoriesLoadingFailed();
      }
    }
  }
}
