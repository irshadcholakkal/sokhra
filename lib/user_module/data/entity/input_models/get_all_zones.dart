import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lumiereorganics_app/user_module/data/entity/input_models/zones.dart';

part 'get_all_zones.freezed.dart';
part 'get_all_zones.g.dart';

@freezed
abstract class GetAllZones with _$GetAllZones {
   factory GetAllZones({
     @JsonValue([]) final List<Zones>? zones,
      final int? totalCount,

   }) = _GetAllZones;
   factory GetAllZones.fromJson(Map<String, dynamic> json) => _$GetAllZonesFromJson(json);
}