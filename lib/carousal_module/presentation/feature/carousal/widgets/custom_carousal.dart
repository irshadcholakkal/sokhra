import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../domain/models/banner.dart' as banner;
import '../blocs/carousal_bloc/carousal_bloc.dart';

class CustomCarousal extends StatelessWidget {
  const CustomCarousal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CarousalBloc>(context).add(CarousalFetchEvent());
    return Container(child:
        BlocBuilder<CarousalBloc, CarousalState>(builder: (context, state) {
      if (state is CarousalLoading) {
        return Container(
          height: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: 12),
          child:Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: AppColorScheme.onPrimaryLight.withOpacity(0.6),
            period: Duration(seconds: 5),

            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color:  AppColorScheme.onPrimaryLight,
              ),

            ),

          )


          // Center(
          //   child: CircularProgressIndicator(),
          // ),
        );
      } else if (state is CarousalLoadedFailed) {
        return  InkWell(
          onTap: (){
            BlocProvider.of<CarousalBloc>(context).add(CarousalFetchEvent());
          },
          child: Center(
            // child: Text(
            //   state.error,
            //   style: Theme.of(context).textTheme.headline6,
            // ),


            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
            //   Text(
            //     state.error,
            //   style: Theme.of(context).textTheme.headline6,
            // ),
                Text("Click to refresh", style: Theme.of(context).textTheme.headline6,),
                SizedBox(width: 10,),
                Icon(Icons.refresh_sharp)
              ])



          ),
        );
      } else if (state is CarousalLoadedSuccess) {
        final List<banner.Banner> _list = state.banners.banners ?? [];
        if (_list.isNotEmpty) {
          List<banner.Banner> _finalList = [];
          _list.forEach((element) {
            if (element.isActive == true) {
              _finalList.add(element);
            }
          });
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppPadding(
                dividedBy: 2,
              ),
              CarouselSlider.builder(
                itemCount: _finalList.length,
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  height: 150,
                  initialPage: 0,
                  autoPlay: true,
                  aspectRatio: 1 / 4,
                  viewportFraction: 0.9,
                  autoPlayInterval: Duration(seconds: 6),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                ),
                itemBuilder: (context, itemIndex, pageIndex) {
                  String url = _finalList[itemIndex].avatar != null
                      ? _finalList[itemIndex].avatar!
                      : "";
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppConstants.cornerRadius)),
                    child: Container(

                      // width: MediaQuery.of(context).size.width*0.9,
                      child: Image.network(
                        AppConstants.filesUrl + url,
                        // image,
                        errorBuilder: (context, exception, stacktrace) {
                          debugPrint("${exception}");
                          return Container(
                              width: double.infinity,
                              height: double.infinity,
                              // color: Colors.yellow,
                              child: Image.asset(ThemeAssets.dummy_image_wider,fit: BoxFit.cover,));

                        },
                        // fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        } else {
          // return Center(
          //   child: Text(
          //     "Promotions empty",
          //     style: Theme.of(context).textTheme.headline6,
          //   ),
          // );
          return Container();
        }
      } else {
        return Text(
          translation.of("unexpected_error_occurred"),
          style: Theme.of(context).textTheme.headline6,
        );
      }
    }));
  }
}
