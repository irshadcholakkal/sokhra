import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../base_module/presentation/core/values/app_assets.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';

class DetailsImageCarousal extends StatelessWidget {
  final List<String?>? imageList;
  const DetailsImageCarousal({Key? key, required this.imageList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double longestSide = MediaQuery.of(context).size.longestSide;
    double width = MediaQuery.of(context).size.width;

    if (imageList?.length != null && imageList!.isNotEmpty) {
      return CarouselSlider.builder(
        itemCount: imageList?.length,
        options: CarouselOptions(
          enableInfiniteScroll: false,
          height: 200,
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
          String url =
              imageList![itemIndex] != null ? imageList![itemIndex]! : "";
          return InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: CarouselSlider.builder(
                        itemCount: imageList?.length,
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          height: height == longestSide ? height / 2 : width,
                          initialPage: pageIndex,
                          autoPlay: true,
                          aspectRatio: 1 / 4,
                          viewportFraction: 1,
                          autoPlayInterval: Duration(seconds: 6),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                        ),
                        itemBuilder: (context, itemIndex, pageIndex) {
                          String url = imageList![itemIndex] != null
                              ? imageList![itemIndex]!
                              : "";
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    AppConstants.cornerRadius)),
                            child: Container(
                              child: Image.network(
                                AppConstants.filesUrl + url,

                                errorBuilder: (context, exception, stacktrace) {
                                  debugPrint("${exception}");
                                  return Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      // child: Image.network(
                                      //     AppConstants.dummyImage));
                                  child: Image.asset(
                                          ThemeAssets.dummy_image_wider,fit: BoxFit.cover,)
                                  );
                                },
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  });
            },
            child: Card(
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
                        // child: Image.network(AppConstants.dummyImage));
                        child: Image.asset(ThemeAssets.dummy_image_wider,fit: BoxFit.cover,));
                  },
                  fit: BoxFit.fill,
                ),
              ),
            ),
          );
        },
      );
    } else {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
        image: DecorationImage(
          image: AssetImage(ThemeAssets.dummy_image_wider),fit: BoxFit.cover
        )
        ),

      );
    }
  }
}
