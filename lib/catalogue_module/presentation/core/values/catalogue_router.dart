import 'package:flutter/material.dart';

import '../../../domain/models/product.dart';
import '../../feature/details/screens/details_screen.dart';
import '../../feature/list_catalogue/screens/list_catalogue.dart';
import '../../feature/list_catalogue/screens/products_list.dart';

class CatalogueRouter {
  static const detailScreen = "/descriptionScreen";
  static const listCatalogue = "/listCatalogue";
  static const productsList = "/productsList";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case detailScreen:
        final args = settings.arguments as Product?;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => DetailsScreen(product: args),
        );
      case listCatalogue:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ListCatalogue(),
        );
      case productsList:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProductsList(),
        );
      default:
        return null;
    }
  }
}
