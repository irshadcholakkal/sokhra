import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../base_module/data/entity/graphql_service.dart';
import '../../../base_module/data/entity/models/data_response.dart';
import '../../../base_module/data/entity/models/page_input.dart';
import '../../../base_module/data/entity/models/sort_input.dart';
import '../../../user_module/domain/user_data.dart';
import '../../domain/models/category_list.dart';
import '../../domain/models/delivery_shift.dart';
import '../../domain/models/product_list.dart';
import '../schemas/delivery_check_schema.dart';
import '../schemas/list_catalogue_schema.dart';
import '../schemas/product_details_schema.dart';
import '../schemas/products_list_schema.dart';

const String CATEGORY_ID = "5fc4808aa659f339d08d1dbf";

class CatalogueProvider {
  final _productsListSchema = ProductsListSchema();
  final _categoryListSchema = ListCatalogueSchema();
  final _deliveryCheckSchema = DeliveryCheckSchema();
  final _productDetailsSchema = ProductDetailsSchema();

  Future<DataResponse> getFeatured({
    required bool reFetch,
    SortInput? sortInput,
    PageInput? pageInput,
    // required String pincode,
    double? lat,
    double? lng,
  }) async {
    final _queryOptions = GraphQLService().makeQueryOptions(
      query: _productsListSchema.getProducts,
      variables: sortInput == null
          ? {
              "pinCode": userData.pinCode,
              "input": pageInput ?? PageInput(),
              "filter": {"featured": true},
              // "lat": lat,
              // "lng": lng
            }
          : {
              "pinCode": userData.pinCode,
              "sort": sortInput,
              "input": pageInput ?? PageInput(),
              "filter": {"featured": true},
              // "lat": lat,
              // "lng": lng
            },
      networkOnly: reFetch,
    );

    final _graphQLResponse =
        await graphQLService.performQuery(queryOptions: _queryOptions);
    // debugPrint("getFeatured pinCode is" + pincode);

    if (_graphQLResponse.hasData) {
      // debugPrint("getFeatured response" + _graphQLResponse.data.toString());
      return DataResponse(data: _graphQLResponse.data);
    } else {
      final errorInfo = _graphQLResponse.error;
      // debugPrint("catalogue provider getFeatured error:${errorInfo?.message}");
      return DataResponse(
        error: errorInfo?.type,
      );
    }
  }

  Future<DataResponse> getCategories({required bool reFetch}) async {
    final _queryOptions = GraphQLService().makeQueryOptions(
      query: _categoryListSchema.getCategories,
      variables: {"pinCode": userData.pinCode},
      networkOnly: reFetch,
    );

    final _graphQLResponse =
        await GraphQLService().performQuery(queryOptions: _queryOptions);

    if (_graphQLResponse.hasData) {
      // debugPrint("catalogue provider getCategories:${_graphQLResponse.data}");
      return DataResponse(data: CategoryList.fromJson(_graphQLResponse.data));
    } else {
      final _errorInfo = _graphQLResponse.error;
      // debugPrint("catalogue provider  error:${_errorInfo?.message}");
      return DataResponse(error: _errorInfo?.type);
    }
  }

  Future<DataResponse> getDeals({
    required bool reFetch,
    SortInput? sortInput,
    PageInput? pageInput,
    // required String pinCode,
    double? lat,
    double? lng,
  }) async {
    final _queryOptions = GraphQLService().makeQueryOptions(
        query: _productsListSchema.getProducts,
        variables: sortInput == null
            ? {
                "input": pageInput ?? PageInput(),
                "filter": {
                  "offered": true,
                },
                "pinCode": userData.pinCode,
                // "lat": lat,
                // "lng": lng
              }
            : {
                "input": pageInput ?? PageInput(),
                "sort": sortInput,
                "filter": {
                  "offered": true,
                },
                "pinCode": userData.pinCode,
                // "lat": lat,
                // "lng": lng
              },
        networkOnly: reFetch);

    final _graphQLResponse =
        await graphQLService.performQuery(queryOptions: _queryOptions);
    // debugPrint("getFeatured pinCode is" + pincode);

    if (_graphQLResponse.hasData) {
      return DataResponse(
          data: ProductList.fromJson(_graphQLResponse.data["customerPoducts"]));
    } else {
      final errorInfo = _graphQLResponse.error;
      // debugPrint("catalogue provider getFeatured error:${errorInfo?.message}");
      return DataResponse(
        error: errorInfo?.type,
      );
    }
  }

  Future<DataResponse> getProducts({
    required bool reFetch,
    required String? categoryId,
    required String? subCategoryId,
    PageInput? pageInput,
    String? name,
    double? lat,
    double? lng,
    required SortInput? sortInput,
    // String? pinCode
  }) async {
    final _queryOptions = GraphQLService().makeQueryOptions(
      query: _productsListSchema.getProducts,
      variables: {
        "input": pageInput ?? PageInput(),
        "sortInput": sortInput,
        "filter": {
          "category": categoryId ?? "",
          "name": name,
          "subCategory": subCategoryId ?? ""
        },
        "pinCode": userData.pinCode,
        // "lat": lat,
        // "lng": lng,
      },
      networkOnly: reFetch,
    );

    final _graphQLResponse =
        await graphQLService.performQuery(queryOptions: _queryOptions);

    if (_graphQLResponse.hasData) {
      debugPrint("catalogue provider getProducts${_graphQLResponse.data}");
      return DataResponse(
          data: ProductList.fromJson(_graphQLResponse.data["customerPoducts"]));
    } else {
      final errorInfo = _graphQLResponse.error;
      return DataResponse(
        error: errorInfo?.type,
      );
    }
  }

  Future<DataResponse> deliveryCheck({
    required String pincode,
    // required double ? lat,
    // required double ? lng,
  }) async {
    final _queryOptions = GraphQLService().makeQueryOptions(
        query: _deliveryCheckSchema.deliveryCheckUsingPincode,
        variables: {
          "pincode": 
          pincode,
          // "lat" : lat,
          // "lng": lng
        });

    final _graphQLResponse =
        await graphQLService.performQuery(queryOptions: _queryOptions);

    if (_graphQLResponse.hasData) {
      debugPrint("catalogue provider checkDelivery${_graphQLResponse.data}");
      return DataResponse(
          data: _graphQLResponse.data["deliveryCheckUsingPincode"]);
    } else {
      final errorInfo = _graphQLResponse.error;
       debugPrint("catalogue provider getProducts error:${errorInfo?.message}");
      return DataResponse(
        error: errorInfo?.type,
      );
    }
  }

  Future<DataResponse> getProductDetails({
    required String productId,
    // required String pincode,
    required bool reFetch,
    required double lat,
    required double lng,
  }) async {
    final _queryOptions = GraphQLService().makeQueryOptions(
      query: _productDetailsSchema.getProductDetails,
      variables: {
        "pinCode": userData.pinCode,
        "id": productId,
        // "lat": lat,
        // "lng": lng
      },
      networkOnly: reFetch,
    );
    // debugPrint("getProductDetails called");
    final _graphQLResponse =
        await graphQLService.performQuery(queryOptions: _queryOptions);

    if (_graphQLResponse.hasData) {
      // debugPrint(
      //     "catalogue provider getProductDetails${_graphQLResponse.data}");
      return DataResponse(data: _graphQLResponse.data);
    } else {
      final errorInfo = _graphQLResponse.error;
      // debugPrint("catalogue provider error:${errorInfo?.message}");
      return DataResponse(
        error: errorInfo?.type,
      );
    }
  }






Future<DataResponse> getDeliveryShift({String ?zone }) async {

  
  final _queryOptions = GraphQLService().makeQueryOptions(
      query: _deliveryCheckSchema.getDeliveryShiftsByZone,
      variables: {
       "zone":zone
      },
      networkOnly: true,
      );  
  
  final _graphQLResponse =
      await graphQLService.performQuery(queryOptions: _queryOptions);

     debugPrint("data is==${_graphQLResponse.data}");

  


  if (_graphQLResponse.hasData) {
  print("graphQLresponse${_graphQLResponse.data}");
  return DataResponse(data: _graphQLResponse.data);
}  else {
  final errorInfo = "Unknown GraphQL error";
  debugPrint("Unknown GraphQL error");
  return DataResponse(error: errorInfo);
}

 

  




}



// Future<DataResponse> getDeliveryShift({String? zone}) async {
//   final _queryOptions = GraphQLService().makeQueryOptions(
//     query: _deliveryCheckSchema.getDeliveryShiftsByZone,
//     variables: {"zone": zone},
//   );

//   final _graphQLResponse = await graphQLService.performQuery(queryOptions: _queryOptions);

//   debugPrint("data is==${_graphQLResponse.data}");

//   if (_graphQLResponse.hasData) {
//     final List<dynamic>? shiftsData = _graphQLResponse.data?['getDeliveryShiftsByZone'];

//     if (shiftsData != null) {
//       // Parse the list of delivery shifts
//       // final List<DeliveryShift> shifts = shiftsData
//       //     .map((shiftJson) => DeliveryShift.fromJson(shiftJson))
//       //     .toList();

//       // Create a DeliveryShifts object with the parsed shifts
//       // final deliveryShifts = DeliveryShifts(deliveryshifts: DeliveryShifts.fromJson( _graphQLResponse.data?['getDeliveryShiftsByZone']));

//       // debugPrint("!!$deliveryShifts");

//       return DataResponse(data: shiftsData);
//     } else {
//      final errorInfo = _graphQLResponse.error!.message;
//     debugPrint("Error: $errorInfo");
//     return DataResponse(
//       error: errorInfo,
//     );
//     }
//   } else {
//     final errorInfo = _graphQLResponse.error!.message;
//     debugPrint("Error: $errorInfo");
//     return DataResponse(
//       error: errorInfo,
//     );
//   }
// }




}



