part of 'get_all_available_zone_bloc.dart';

abstract class GetAllZoneState extends Equatable {
  const GetAllZoneState();
}
class  GetAllZoneInitial extends GetAllZoneState{
  @override
  List<Object?> get props => [];
}
class  GetAllZoneLoading extends GetAllZoneState{
  @override
  List<Object?> get props => [];
}
class  GetAllZoneLoaded extends GetAllZoneState{
  List<Zones> ?zones;
     GetAllZoneLoaded({required this.zones});

  @override
  List<Object?> get props => [
    zones
    ];
}
class  GetAllZoneFailed extends GetAllZoneState{
  

  @override
  List<Object?> get props => [];
}
