import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_sort.freezed.dart';
part 'item_sort.g.dart';

@freezed
abstract class ItemSort with _$ItemSort {
   factory ItemSort({
    final String? nameEn,
   
    final String? id,

   }) = _ItemSort;
   factory ItemSort.fromJson(Map<String, dynamic> json) => _$ItemSortFromJson(json);
}