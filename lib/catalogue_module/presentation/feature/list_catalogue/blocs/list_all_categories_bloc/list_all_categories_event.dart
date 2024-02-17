import 'package:equatable/equatable.dart';

abstract class ListAllCategoriesEvent extends Equatable {
  const ListAllCategoriesEvent();
}

class ListAllCategories extends ListAllCategoriesEvent {
  final String pincode;
  ListAllCategories({
    required this.pincode,
 });

  @override
  List<Object?> get props => [
         pincode,
      ];
}
