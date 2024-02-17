import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../domain/entity/color_scheme.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool canGoBack;
  final String? traling;
  final VoidCallback? ontap;
  final Color? color;

  const SimpleAppBar(
      {Key? key, this.title, this.canGoBack = true, this.traling, this.ontap,this.color})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color !=null? color:
       AppColorScheme.surfaceColorLight,
      title: Text(
        title ?? "",
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
      centerTitle: true,
      leading: canGoBack
          ? IconButton(
              icon: Container(
                width: 36,
                height: 36,
                decoration: ShapeDecoration(
                  color: Color(0xFFECDCFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Icon(Iconsax.arrow_left, color: AppColorScheme.onBlack),
              ),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }else{
                  ontap?.call();
                }
              },
              iconSize: 18,
            )
          : null,
      actions: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: InkWell(
              onTap: ontap,
              child: Text(
                traling ?? '',
                style: TextStyle(
                  color: AppColorScheme.primaryColor,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
