import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repositories/display_all_banners_provider.dart';
import '../../../../../domain/models/banners.dart';
import 'get_all_banners_event.dart';
import 'get_all_banners_state.dart';

class GetAllBannersBloc extends Bloc<GetAllBannersEvent, GetAllBannersState> {
  DisplayAllBannersProvider _displayAllBannersProvider =
      DisplayAllBannersProvider();
  GetAllBannersBloc() : super(GetAllBannersInitial());

  @override
  Stream<GetAllBannersState> mapEventToState(GetAllBannersEvent event) async* {
    if (event is FetchAllBanners) {
      yield GetAllBannersLoading();
      final dataResponse = await _displayAllBannersProvider.displayAllBanners();
      if (dataResponse.hasData) {
        BannersRootModel bannersList =
            BannersRootModel.fromJson(dataResponse.data);
        print(bannersList);
        if (bannersList.customerGetAllBanners != null) {
          if (bannersList.customerGetAllBanners!.isNotEmpty) {
            yield GetAllBannersLoaded(
                banners: bannersList.customerGetAllBanners);
          } else {
            yield GetAllBannersLoadingFailed();
          }
        } else {
          yield GetAllBannersLoadingFailed();
        }
      } else {
        yield GetAllBannersLoadingFailed();
      }
    }
  }
}
