import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../base_module/domain/entity/color_scheme.dart';
import '../../../base_module/domain/entity/translation.dart';
import '../../../base_module/presentation/core/values/app_constants.dart';
import '../../domain/new_cart_model.dart';
import '../blocs/new_cart_bloc/new_cart_bloc.dart';
import '../blocs/new_cart_bloc/new_cart_event.dart';
import '../blocs/new_update_cart_bloc/new_update_cart_bloc.dart';
import '../blocs/new_update_cart_bloc/new_update_cart_event.dart';
import '../blocs/new_update_cart_bloc/new_update_cart_state.dart';

class IncrementDecrementButton extends StatefulWidget {
  final int itemQuantity;
  final int minimumQuantity;
  final int maximumQuantity;
  final String cartItemId;
  final String pincode;
  final bool showDelete;
  final bool hideCount;
  final double? borderRadius;
  final double? width;
  final double? height;

  const IncrementDecrementButton({
    Key? key,
    required this.cartItemId,
    required this.itemQuantity,
    required this.maximumQuantity,
    required this.minimumQuantity,
    required this.pincode,
    this.showDelete = false,
    this.hideCount = false,
    this.borderRadius,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<IncrementDecrementButton> createState() =>
      _IncrementDecrementButtonState();
}

class _IncrementDecrementButtonState extends State<IncrementDecrementButton> {
  List<Cart> cartList = [];
  int _itemQuantity = 1;
  final _newUpdateCartBloc = NewUpdateCartBloc();

  @override
  void initState() {
    super.initState();
    _itemQuantity = widget.itemQuantity;
  }

  @override
  void dispose() {
    _newUpdateCartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _itemQuantity = widget.itemQuantity;

    return Container(
      width: widget.width ?? 88,
      height: widget.height ?? 36,
      decoration: widget.hideCount
          ? null
          : BoxDecoration(
              color: AppColorScheme.onPrimaryLight,
              borderRadius: BorderRadius.circular(
                widget.borderRadius ?? AppConstants.cornerRadius / 3,
              ),
            ),
      child: BlocConsumer<NewUpdateCartBloc, NewUpdateCartState>(
        bloc: _newUpdateCartBloc,
        listener: (context, state) {
          if (state is UpdateCartLoaded) {
            setState(() {
                                                                  print("************************${widget.cartItemId}");

              _itemQuantity = state.quantity!;
            });

            BlocProvider.of<NewCartBloc>(context).add(
              FetchCartItems(pincode: widget.pincode),
            );
          }
        },
        builder: (context, state) {
          if (state is UpdateCartLoading) {
            return Center(
              child: CupertinoActivityIndicator(color: AppColorScheme.onPrimaryLight),
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!widget.hideCount)
                  Expanded(
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            final newQuantity = _itemQuantity - 1;
                        
                            if (newQuantity > 0) {
                              setState(() {
                                _itemQuantity = newQuantity;
                              });
                        
                              _newUpdateCartBloc.add(
                                DecrementCartItemValue(
                                  cartItemId: widget.cartItemId,
                                  pincode: widget.pincode,
                                  quantity: _itemQuantity,
                                ),
                              );
                            } else {

                              _showDeleteConfirmDialog();
                            // _showDeleteConfirmBottomSheet();
                            }
                          },
                          child: Container(
                            width: 32,
                        height: 32,
                        //padding: const EdgeInsets.symmetric(horizontal: 16),
                        //clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                        color: AppColorScheme.primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                            child: Icon(
                              Icons.remove,
                              size: 20,
                              color: AppColorScheme.onPrimaryLight,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              _itemQuantity.toString(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24,
                                    fontFamily:'GeneralSans',
                                    color: AppColorScheme.primaryColor,
                                  ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (_itemQuantity < widget.maximumQuantity) {
                              setState(() {
                                _itemQuantity = _itemQuantity + 1;
                              });
                        
                              _newUpdateCartBloc.add(
                                IncrementCartItemValue(
                                  cartItemId: widget.cartItemId,
                                  pincode: widget.pincode,
                                  quantity: _itemQuantity,
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                          //  padding:
                               // const EdgeInsets.symmetric(horizontal: 16),
                           // clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: AppColorScheme.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                size: 20,
                                color: AppColorScheme.onPrimaryLight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (widget.showDelete) ...[
                  if (!widget.hideCount) SizedBox(width: 8),
                  InkWell(
                    onTap:
                    //_showDeleteConfirmBottomSheet,
                     _showDeleteConfirmDialog,
                    child: Icon(
                      MdiIcons.deleteOutline,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  )
                ],
              ],
            );
          }
        },
      ),
    );
  }

  void _showDeleteConfirmDialog() {
    bool isDeleting = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState2) {
          return BlocListener<NewUpdateCartBloc, NewUpdateCartState>(
            bloc: _newUpdateCartBloc,
            listener: (context, state) {
              if (state is DeleteCartSuccess) {
                BlocProvider.of<NewCartBloc>(context).add(
                  FetchCartItems(pincode: widget.pincode),
                );

                Navigator.of(context).pop();
              } else if (state is DeleteCartFailed) {
                setState2(() {
                  isDeleting = false;
                });
              }
            },
            child: AlertDialog(
              insetPadding: const EdgeInsets.all(AppConstants.defaultPadding),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
              ),
              title: Text(
                "Confirm delete",
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              content: Text(
                "Are you sure to remove this item from cart?",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              actionsAlignment: MainAxisAlignment.spaceAround,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    if (isDeleting) return;
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    translation.of('no').toUpperCase(),
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                  style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 45),
                        ),
                      ),
                ),
                OutlinedButton(
                  onPressed: () {
                    if (isDeleting) return;

                    setState2(() {
                      isDeleting = true;
                    });

                    _newUpdateCartBloc.add(
                      DeleteCartItem(cartItemId: widget.cartItemId),
                    );
                  },
                  child: isDeleting
                      ? CupertinoActivityIndicator()
                      : Text(
                          translation.of("yes").toUpperCase(),
                          style: Theme.of(context).textTheme.button?.copyWith(
                              color: Theme.of(context).colorScheme.error),
                        ),
                  style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 45),
                        ),
                        side: MaterialStateProperty.all(
                          BorderSide(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

 void _showDeleteConfirmBottomSheet() {
    bool isDeleting = false;

    showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppConstants.cornerRadius)),
    ),
    builder: (context) {
      return StatefulBuilder(builder: (context, setState2) {
        return BlocListener<NewUpdateCartBloc, NewUpdateCartState>(
          bloc: _newUpdateCartBloc,
          listener: (context, state) {
            if (state is DeleteCartSuccess) {
              BlocProvider.of<NewCartBloc>(context).add(
                FetchCartItems(pincode: widget.pincode),
              );

              Navigator.of(context).pop();
            } else if (state is DeleteCartFailed) {
              setState2(() {
                isDeleting = false;
              });
            }
          },
          child: Container(
            padding: EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Confirm delete.................",
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                SizedBox(height: 12),
                Text(
                  "Are you sure to remove this item from the cart???????",
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (isDeleting) return;
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        translation.of('no').toUpperCase(),
                        style: Theme.of(context).textTheme.button?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(horizontal: 45),
                            ),
                          ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        if (isDeleting) return;

                        setState2(() {
                          isDeleting = true;
                        });

                        _newUpdateCartBloc.add(
                          DeleteCartItem(cartItemId: widget.cartItemId),
                        );
                      },
                      child: isDeleting
                          ? CupertinoActivityIndicator()
                          : Text(
                              translation.of("yes").toUpperCase(),
                              style: Theme.of(context).textTheme.button?.copyWith(
                                  color: Theme.of(context).colorScheme.error),
                            ),
                      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(horizontal: 45),
                            ),
                            side: MaterialStateProperty.all(
                              BorderSide(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
    },
  );
  }

}
