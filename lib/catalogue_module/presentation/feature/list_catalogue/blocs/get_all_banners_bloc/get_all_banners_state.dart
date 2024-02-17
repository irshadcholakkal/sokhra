import 'package:equatable/equatable.dart';

import '../../../../../domain/models/banners.dart';

abstract class GetAllBannersState extends Equatable {
  const GetAllBannersState();
}

class GetAllBannersInitial extends GetAllBannersState {
  @override
  List<Object?> get props => [];
}

class GetAllBannersLoading extends GetAllBannersState {
  @override
  List<Object?> get props => [];
}

class GetAllBannersLoaded extends GetAllBannersState {
  final List<Banner>? banners;

  GetAllBannersLoaded({
    this.banners,
  });
  @override
  List<Object?> get props => [banners];
}

class GetAllBannersLoadingFailed extends GetAllBannersState {
  @override
  List<Object?> get props => [];
}
