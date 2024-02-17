import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../blocs/get_all_banners_bloc/get_all_banners_bloc.dart';
import '../blocs/get_all_banners_bloc/get_all_banners_event.dart';
import '../blocs/get_all_banners_bloc/get_all_banners_state.dart';

class HomeBannerCarousel extends StatefulWidget {
  @override
  State<HomeBannerCarousel> createState() => _HomeBannerCarouselState();
}

class _HomeBannerCarouselState extends State<HomeBannerCarousel> {
  late GetAllBannersBloc _getAllBannersBloc;
  int _currentPosition = 0;

  @override
  void initState() {
    super.initState();
    _getAllBannersBloc = GetAllBannersBloc();
    _getAllBannersBloc.add(FetchAllBanners());
  }

  @override
  void dispose() {
    super.dispose();
    _getAllBannersBloc.close();
  }

  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
      child: BlocBuilder(
        bloc: _getAllBannersBloc,
        builder: (context, state) {
          if (state is GetAllBannersLoading) {
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: 4,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                        color: Colors.grey.shade300,
                      ),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: AppColorScheme.onPrimaryLight.withOpacity(0.6),
                        period: Duration(seconds: 5),
                        child: Container(
                          width: double.infinity,
                          height: 120,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    enableInfiniteScroll: false,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                     onPageChanged: (index, reason) {
                          setState(() {
                _currentPosition = index;
                          });
                        },
                  ),
                ),
                SizedBox(height: 8), 
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Container(
          width: 8,
          height: 2, 
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: index == _currentPosition ? AppColorScheme.primaryColor : Color.fromARGB(109, 146, 96, 232),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    ),
              ],
            );
          } else if (state is GetAllBannersLoaded) {
            return Column(
              children: [
                CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: state.banners!.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                        color: Colors.grey.shade300,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11.0),
                        child: CachedNetworkImage(
                          alignment: Alignment.center,
                          imageUrl: AppConstants.filesUrl +
                              state.banners![index].avatar!,
                          fit: BoxFit.fill,
                          errorWidget: (context, url, error) {
                            return Image.asset(
                              ThemeAssets.dummy_image_wider,
                            );
                          },
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentPosition = index;
                      });
                    },
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                ),
                SizedBox(height: 8), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    state.banners!.length,
                    (index) => Container(
                      width: 8,
                      height: 2, 
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: index == _currentPosition
                            ? AppColorScheme.primaryColor
                            : Color.fromARGB(109, 146, 96, 232),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is GetAllBannersInitial) {
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11.0),
                        color: Colors.grey.shade300,
                      ),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: AppColorScheme.onPrimaryLight.withOpacity(0.6),
                        period: Duration(seconds: 5),
                        child: Container(
                          width: double.infinity,
                          height: 120,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: false,
                    enableInfiniteScroll: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentPosition = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: 8), 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => Container(
                      width: 8,
                      height: 2, 
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: index == _currentPosition
                            ? AppColorScheme.primaryColor
                            : Color.fromARGB(109, 146, 96, 232),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
