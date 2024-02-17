import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../base_module/data/entity/models/data_response.dart';
import '../../../../../../base_module/data/entity/models/error_info.dart';
import '../../../../../data/repositories/catalogue_provider.dart';
import '../../../../../domain/models/product.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsLoading());

  final _catalogueProvider = CatalogueProvider();

  getProductDetails(
      {required String productId,
      // required String pincode,
      required bool reFetch,
        required double lat,
        required double lng
      }) async {
    emit(ProductDetailsLoading());
    try {
      final DataResponse _dataResponse =
          await _catalogueProvider.getProductDetails(
              productId: productId,
              // pincode: pincode,
              reFetch: reFetch,
          lng: lng,lat: lat

          );
      // debugPrint("getProductDetails pincode is $pincode");
      Product? product = Product.fromJson(_dataResponse.data["getProduct"]);
      if (_dataResponse.hasData) {
        emit(ProductDetailsLoadingSuccess(product: product));
      } else {
        debugPrint(
            "error from product details cubit is ${_dataResponse.error}");

        emit(ProductDetailsLoadingFailed(
            error: _dataResponse.error ??
                ErrorType.SOME_ERROR.replaceAll("_", " ").toUpperCase()));
      }
    } catch (e) {
      debugPrint("error from product details cubit is ${e.toString()}");
      emit(ProductDetailsLoadingFailed(
          error: ErrorType.SOME_ERROR.replaceAll("_", " ").toUpperCase()));
    }
  }
}
