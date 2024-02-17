import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_type.freezed.dart';
part 'sort_type.g.dart';

@freezed
abstract class SortType with _$SortType {
   factory SortType({
    final SortType? price,
    final SortType? createdAt,
   }) = _SortType;
   factory SortType.fromJson(Map<String, dynamic> json) => _$SortTypeFromJson(json);
}