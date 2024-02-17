import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../base_module/domain/args/navigation_args.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/appbar/custom_appbar.dart';
import '../../../../../base_module/presentation/component/navbar/custom_nav_bar.dart';
import '../../../../../base_module/presentation/component/padding/app_padding.dart';
import '../../../../../base_module/presentation/core/values/app_constants.dart';
import '../../../../../base_module/presentation/util/date_time_helper.dart';
import '../../../../../user_module/domain/entity/authentication.dart';
import '../../../../domain/entity/models/customer_wallet.dart';
import '../../../../domain/entity/payment_screen_args.dart';
import '../../../components/added_money_status.dart';
import '../../../core/values/payments_router.dart';
import '../blocs/refund_history_bloc/refund_history_bloc.dart';
import '../blocs/wallet_balance_bloc/wallet_balance_bloc.dart';
import '../blocs/wallet_bloc/wallet_bloc.dart';
import '../blocs/wallet_credit_history_bloc/wallet_credit_history_bloc.dart';
import '../blocs/wallet_debit_history_bloc/wallet_debit_history_bloc.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static const List<int> _addToWalletButtonList = [50, 100, 200, 500];
  final _formKey = GlobalKey<FormBuilderState>();
  final TextEditingController _addMoneyController = TextEditingController();
  late FromDrawerArgs? _args;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _addMoneyController.text = "0";
    BlocProvider.of<WalletCreditHistoryBloc>(context)
        .add(WalletCreditHistoryFetchEvent());
    BlocProvider.of<WalletDebitHistoryBloc>(context)
        .add(WalletDebitHistoryFetchEvent());
    BlocProvider.of<WalletBalanceBloc>(context).add(WalletBalanceFetchEvent());
    BlocProvider.of<RefundHistoryBloc>(context).add(RefundHistoryFetchEvent());
  }

  @override
  void didChangeDependencies() {
    _args = ModalRoute.of(context)!.settings.arguments as FromDrawerArgs?;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          return true;
        } else {
          return false;
          // ExitPopupHelper.showExitPopup(context);
        }
      },
      child: Scaffold(
        bottomNavigationBar: CustomNavBar(),
        appBar: _args?.isFromDrawer ?? false
            ? CustomAppbar(
                isHome: false,
                isTitleText: true,
                titleText: translation.of("cart.wallet"),
                context: context,
              )
            : CustomAppbar(
                isHome: true,
                context: context,
              ),
        body: !authentication.isAuthenticated
            ? Container()
            : RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView(
                  children: [
                    BlocListener<WalletBloc, WalletState>(
                      listener: (context, state) {
                        if (state is WalletCreditSuccess) {
                          BlocProvider.of<WalletCreditHistoryBloc>(context)
                              .add(WalletCreditHistoryFetchEvent(reFetch: true));
                          BlocProvider.of<WalletBalanceBloc>(context)
                              .add(WalletBalanceFetchEvent(reFetch: true));
                        }

                        if (state is WalletInitiateSuccess) {
                          // debugPrint("===============================================");
                          // debugPrint("response is ${state.response.toJson()}");
                          // debugPrint("===============================================");
                          // debugPrint("reference id is ${state.response.referrenceId}");
                          // debugPrint("===============================================");
                          // pushNewScreenWithRouteSettings(context,
                          //     settings: RouteSettings(
                          //         name: PaymentsRouter.paymentScreen,
                          //         arguments: PaymentScreenArgs(
                          //             response: state.response, isFromWallet: true)),
                          //     screen: PaymentScreen());
                          Navigator.of(context).pushNamed(
                              PaymentsRouter.paymentScreen,
                              arguments: PaymentScreenArgs(
                                  response: state.response, isFromWallet: true));
                        }
                      },
                      child: Center(
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 380),
                          padding: EdgeInsets.symmetric(
                              horizontal: AppConstants.defaultPadding * 0.2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppPadding(),
                              Text(
                                translation.of("payment.wallet"),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              ),
                              AppPadding(),
                              _totalBalanceWidget(context),
                              AppPadding(),
                              Text(
                                translation.of("payment.payment_history"),
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.5)),
                              ),
                              AppPadding(
                                dividedBy: 2,
                              ),
                              _paymentHistoryTab(context),
                              AppPadding(
                                dividedBy: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Card _paymentHistoryTab(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Card(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: Theme.of(context).colorScheme.primary,
              labelColor: Theme.of(context).colorScheme.primary,
              labelPadding: EdgeInsets.all(10),
              indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
              labelStyle: Theme.of(context).textTheme.subtitle2!.copyWith(),
              unselectedLabelStyle:
                  Theme.of(context).textTheme.subtitle2!.copyWith(),
              unselectedLabelColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.5),
              tabs: [
                Tab(
                  child: Text(
                    translation.of("payment.credit").toUpperCase(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Tab(
                  child: Text(
                    translation.of("payment.debit").toUpperCase(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Tab(
                  child: Text(
                    translation.of("payment.refund").toUpperCase(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Container(
              height: height * 0.37,
              child: TabBarView(controller: _tabController, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<WalletCreditHistoryBloc,
                      WalletCreditHistoryState>(
                    builder: (context, state) {
                      if (state is WalletCreditHistoryFetchSuccess) {
                        List<CustomerWallet?> list =
                            state.walletList?.getCustomerWallet ?? [];
                        if (list.isNotEmpty) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                CustomerWallet? data = list[index];
                                var utcTime =
                                    dateTimeHelper.parseDateTimeString(
                                        dateTime: "${data?.createdAt}");
                                String? localTime =
                                    dateTimeHelper.toDateTimeString(utcTime,
                                        dateFormat: "d MMMM y");
                                bool? credit;
                                debugPrint(" credit is ${data?.credit}");
                                if (data?.credit == null ||
                                    data?.credit == 0 ||
                                    data?.credit == 0.0) {
                                  credit = false;
                                } else if (data?.credit != null &&
                                    (data?.credit == null
                                        ? false
                                        : data!.credit! > 0)) {
                                  credit = true;
                                }
                                return AddedMoneyStatus(
                                    isCredit: credit,
                                    transactionDate:
                                        localTime ?? translation.of("n/a"),
                                    transactionStatus:
                                        data?.status ?? translation.of("n/a"),
                                    transactionId: data?.referrence ??
                                        translation.of("n/a"),
                                    transactionAmount:
                                        "${(credit == true ? data?.credit : data?.debit) ?? translation.of("n/a")}");
                              });
                        } else {
                          return Center(
                            child: Text("No transactions yet"),
                          );
                        }
                      } else if (state is WalletCreditHistoryFetchFailed) {
                        return InkWell(
                          onTap: (){
                            BlocProvider.of<WalletCreditHistoryBloc>(context)
                                .add(WalletCreditHistoryFetchEvent(reFetch: true));

                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Click to refresh"),
                                SizedBox(width: 10,),
                                Icon(Icons.refresh)
                              ],
                            ),
                          ),
                        );
                      } else if (state is WalletCreditHistoryLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Center(
                          child:
                              Text(translation.of("unexpected_error_occurred")),
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<WalletDebitHistoryBloc,
                      WalletDebitHistoryState>(
                    builder: (context, state) {
                      if (state is WalletDebitHistoryFetchSuccess) {
                        List<CustomerWallet?> list =
                            state.walletList?.getCustomerWallet ?? [];
                        if (list.isNotEmpty) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                CustomerWallet? data = list[index];
                                var utcTime =
                                    dateTimeHelper.parseDateTimeString(
                                        dateTime: "${data?.createdAt}");
                                String? localTime =
                                    dateTimeHelper.toDateTimeString(utcTime,
                                        dateFormat: "d MMMM y");
                                bool? credit;
                                debugPrint(" credit is ${data?.credit}");
                                if (data?.credit == null ||
                                    data?.credit == 0 ||
                                    data?.credit == 0.0) {
                                  credit = false;
                                } else if (data?.credit != null &&
                                    (data?.credit == null
                                        ? false
                                        : data!.credit! > 0)) {
                                  credit = true;
                                }
                                return AddedMoneyStatus(
                                    isCredit: credit,
                                    transactionDate:
                                        localTime ?? translation.of("n/a"),
                                    transactionStatus:
                                        data?.status ?? translation.of("n/a"),
                                    transactionId: data?.referrence ??
                                        translation.of("n/a"),
                                    transactionAmount:
                                        "${(credit == true ? data?.credit : data?.debit) ?? translation.of("n/a")}");
                              });
                        } else {
                          return Center(
                            child: Text("No transactions yet"),
                          );
                        }
                      } else if (state is WalletDebitHistoryFetchFailed) {
                        return

                          InkWell(
                            onTap: (){

                              BlocProvider.of<WalletDebitHistoryBloc>(context)
                                  .add(WalletDebitHistoryFetchEvent(reFetch: true));
                            },
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Click to refresh"),
                                  SizedBox(width: 10,),
                                  Icon(Icons.refresh)
                                ],
                              ),
                            ),
                          );

                        //   Center(
                        //   child: Text("${state.error}"),
                        // );
                      } else if (state is WalletDebitHistoryLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Center(
                          child:
                              Text(translation.of("unexpected_error_occurred")),
                        );
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<RefundHistoryBloc, RefundHistoryState>(
                    builder: (context, state) {
                      if (state is RefundHistoryFetchSuccess) {
                        List<CustomerWallet?> list =
                            state.walletList?.getCustomerWallet ?? [];
                        if (list.isNotEmpty) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                CustomerWallet? data = list[index];
                                var utcTime =
                                    dateTimeHelper.parseDateTimeString(
                                        dateTime: "${data?.createdAt}");
                                String? localTime =
                                    dateTimeHelper.toDateTimeString(utcTime,
                                        dateFormat: "d MMMM y");
                                bool? credit;
                                if (data?.credit != null ||
                                    data?.credit != 0.0) {
                                  credit = true;
                                }
                                return AddedMoneyStatus(
                                    isCredit: credit,
                                    transactionDate:
                                        localTime ?? translation.of("n/a"),
                                    transactionStatus:
                                        data?.status ?? translation.of("n/a"),
                                    transactionId: data?.paymentId ??
                                        translation.of("n/a"),
                                    transactionAmount:
                                        "${(credit == true ? data?.credit : data?.debit) ?? translation.of("n/a")}");
                              });
                        } else {
                          return Center(
                            child: Text("No transactions yet"),
                          );
                        }
                      } else if (state is RefundHistoryFetchFailed) {
                        return

                          InkWell(
                            onTap: (){
                              BlocProvider.of<RefundHistoryBloc>(context).add(RefundHistoryFetchEvent(reFetch: true));

                            },
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Click to refresh"),
                                  SizedBox(width: 10,),
                                  Icon(Icons.refresh)
                                ],
                              ),
                            ),
                          );


                        //   Center(
                        //   child: Text("${state.error}"),
                        // );
                      } else if (state is RefundHistoryLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Center(
                          child:
                              Text(translation.of("unexpected_error_occurred")),
                        );
                      }
                    },
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Card _totalBalanceWidget(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(AppConstants.defaultPadding * 0.6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  translation.of("payment.total_balance"),
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5)),
                ),
              ),
            ),
            const AppPadding(
              dividedBy: 6,
            ),
            BlocBuilder<WalletBalanceBloc, WalletBalanceState>(
              builder: (context, state) {
                if (state is WalletBalanceFetchSuccess) {
                  return Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 140,
                          child: Text(
                            "₹ ${state.walletBalance?.balance ?? 0.0}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                          ),
                        ),
                        Container(
                          child: OutlinedButton.icon(
                              onPressed: _showAddMoneyPopup,
                              style: Theme.of(context)
                                  .outlinedButtonTheme
                                  .style!
                                  .copyWith(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                              horizontal:
                                                  AppConstants.defaultPadding *
                                                      0.3,
                                              vertical:
                                                  AppConstants.defaultPadding *
                                                      0.1))),
                              icon: Icon(
                                MdiIcons.plus,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              label: Text(
                                translation
                                    .of("payment.add_money")
                                    .toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              )),
                        ),
                      ],
                    ),
                  );
                } else if (state is WalletBalanceFetchFailed) {
                  return

                    InkWell(
                      onTap: (){
                        BlocProvider.of<WalletBalanceBloc>(context).add(WalletBalanceFetchEvent(reFetch: true));

                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Click to refresh"),
                            SizedBox(width: 10,),
                            Icon(Icons.refresh)
                          ],
                        ),
                      )
                    );

                  //   Container(
                  //   child: Center(
                  //     child: Text(
                  //       state.error,
                  //       style: Theme.of(context).textTheme.headline6,
                  //     ),
                  //   ),
                  // );
                } else if (state is WalletBalanceLoading) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Container(
                    child: Center(
                      child: Text(translation.of("unexpected_error_occurred"),
                          style: Theme.of(context).textTheme.headline6),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAddMoneyPopup() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding * 0.1,
                vertical: AppConstants.defaultPadding),
            child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius:
                      BorderRadius.circular(AppConstants.cornerRadius),
                ),
                constraints: BoxConstraints(
                  maxWidth: 360,
                ),
                padding: EdgeInsets.all(AppConstants.defaultPadding * 0.5),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        translation.of("payment.add_money_to_wallet"),
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      AppPadding(
                        dividedBy: 2,
                      ),
                      FormBuilder(
                          key: _formKey,
                          child: FormBuilderTextField(
                            controller: _addMoneyController,
                            name: 'wallet',
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                MdiIcons.wallet,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.5),
                              ),
                              suffixIcon: IconButton(
                                padding: EdgeInsets.all(0),
                                icon: Icon(
                                  MdiIcons.close,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.5),
                                ),
                                onPressed: () {
                                  _formKey.currentState?.fields['wallet']
                                      ?.reset();
                                },
                              ),
                            ),
                          )),
                      AppPadding(
                        dividedBy: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: _addToWalletButtonList
                            .map((amount) => OutlinedButton(
                                onPressed: () {
                                  double? value = double.tryParse(_formKey
                                      .currentState?.fields['wallet']?.value);
                                  if (value != null) {
                                    double newValue = value + amount;
                                    _addMoneyController.text =
                                        newValue.toString();
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          translation.of("invalid_character")),
                                    ));
                                  }
                                },
                                child: Text(
                                  "+$amount",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.8)),
                                )))
                            .toList(),
                      ),
                      AppPadding(
                        dividedBy: 2,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              double? value = double.tryParse(_formKey
                                  .currentState?.fields['wallet']?.value);
                              if (value != null) {
                                Navigator.pop(context);
                                BlocProvider.of<WalletBloc>(context).add(
                                    WalletInitiateEvent(
                                        note: "", credit: value));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      Text(translation.of("invalid_character")),
                                ));
                              }
                            },
                            child: Text(
                              translation.of("payment.add_money").toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .button!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                            )),
                      )
                    ],
                  ),
                )),
          );
        });
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 0), () {
      BlocProvider.of<WalletCreditHistoryBloc>(context)
          .add(WalletCreditHistoryFetchEvent(reFetch: true));
      BlocProvider.of<WalletBalanceBloc>(context)
          .add(WalletBalanceFetchEvent(reFetch: true));
      BlocProvider.of<RefundHistoryBloc>(context)
          .add(RefundHistoryFetchEvent(reFetch: true));
      BlocProvider.of<WalletDebitHistoryBloc>(context)
          .add(WalletDebitHistoryFetchEvent(reFetch: true));

      return true;
    });
  }
}
