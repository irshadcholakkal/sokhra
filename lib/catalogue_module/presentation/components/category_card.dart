import 'package:flutter/material.dart';

import '../../../base_module/domain/entity/translation.dart';
import '../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../base_module/presentation/core/values/app_assets.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../domain/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Categorys categoryData;
  const CategoryCard({Key? key, required this.categoryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
        ),
        child: Container(
          padding: const EdgeInsets.all(AppConstants.defaultPadding / 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppConstants.cornerRadius))),
                  clipBehavior: Clip.antiAlias,
                  height: 55,
                  width: 55,
                  child: categoryData.avatar != null
                      ? Image.network(
                          AppConstants.filesUrl + categoryData.avatar!,
                          errorBuilder: (context, object, stackTrace) {
                            return Container(
                              child: Image.asset(ThemeAssets.dummy_image_catogery,fit: BoxFit.cover,)
                              // Image.network(AppConstants.dummyImage),
                            );
                          },
                          fit: BoxFit.contain,
                        )
                      :Image.asset(ThemeAssets.dummy_image_catogery,fit: BoxFit.cover,)),
              const AppPadding(
                dividedBy: 3,
              ),
              Container(
                  width: 85,
                  child: Text(
                    categoryData.nameEn ?? translation.of("n/a"),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ))
            ],
          ),
        ));
  }
}
