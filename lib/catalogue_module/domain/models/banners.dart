import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'banners.g.dart';

@JsonSerializable()
class Banner extends Equatable{
  @JsonKey(name:'_id')
  final String? id;
  final String? name;
  final String? avatar;
  final int? sortOrder;
  final String? type;
  final bool? isActive;

  Banner({this.id,this.avatar,this.isActive,this.name,this.sortOrder,this.type,});

  @override
  List<Object?> get props => [id,avatar,isActive,name,sortOrder,type];

  factory Banner.fromJson(Map<String,dynamic> json) => _$BannerFromJson(json);

  Map<String,dynamic> toJson() => _$BannerToJson(this);
} 

@JsonSerializable()
class BannersRootModel extends Equatable{
  final List<Banner>? customerGetAllBanners;

  BannersRootModel({this.customerGetAllBanners,});

  @override
  List<Object?> get props => [customerGetAllBanners];

  factory BannersRootModel.fromJson(Map<String,dynamic> json) => _$BannersRootModelFromJson(json);

  Map<String,dynamic> toJson() => _$BannersRootModelToJson(this);
}