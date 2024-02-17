import 'package:equatable/equatable.dart';

abstract class GetAllBannersEvent extends Equatable{
  const GetAllBannersEvent();
}

class FetchAllBanners extends GetAllBannersEvent{
  @override
  List<Object?> get props => [];
}