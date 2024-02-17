import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lumiereorganics_app/catalogue_module/presentation/feature/list_catalogue/widgets/bottom_navigation.dart';

import '../../../../../base_module/domain/entity/color_scheme.dart';
import '../../../../../base_module/domain/entity/translation.dart';
import '../../../../../base_module/presentation/component/appbar/custom_text_appbar.dart';
import '../../../../../base_module/presentation/component/appbar/simple_app_bar.dart';
import '../../../../domain/user_data.dart';
import '../blocs/notification_list/notification_list_bloc.dart';
import '../components/notification_tiles.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool calledSetNotification = false;

  setNotificationCount({required int count}) async {
    debugPrint("setNotificationCount called");
    await userData.setNotificationCount(count: count);
    await userData.getUserData();
    setState(() {
      calledSetNotification = true;
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotificationListBloc>(context)
        .add(FetchNotificationList(reFetch: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColorScheme.backgroundColorLight,
        appBar:
            SimpleAppBar(
              title: 
              translation.of('notification.notifications'),
             // "Notifications",
               traling: 
               translation.of('notification.mark_all_read'),
               //"Mark all as read"
               ),
        //       // appBar: CustomTextAppbar(
        //       //   context: context,
        //       //   isTitleText: true,
        //       //   titleText: "Notifications",
        //       // ),
        body: BlocBuilder<NotificationListBloc, NotificationListState>(
          builder: (context, state) {
            if (state is FetchNotificationListSuccess) {
              if (state.notificationList.notifications!.length > 0) {
                if (calledSetNotification == false) {
                  setNotificationCount(
                      count: state.notificationList.notifications!.length);
                }
                return RefreshIndicator(
                    onRefresh: () {
                      return Future.delayed(Duration(seconds: 0), () {
                        BlocProvider.of<NotificationListBloc>(context)
                            .add(FetchNotificationList(reFetch: true));
                        return true;
                      });
                    },
                    // child: SingleChildScrollView(
                    //   physics: AlwaysScrollableScrollPhysics(),
                    //   child: Container(
                    //     constraints: const BoxConstraints(maxWidth: 380),
                    //     padding: const EdgeInsets.only(
                    //         top: 10.0,
                    //         //    bottom: 10.0,
                    //         left: 20.0,
                    //         right: 20.0),
                    //     child:
                    //     ListView.separated(
                    //       shrinkWrap: true,
                    //       itemBuilder: (context, index) {
                    //         return NotificationTiles(
                    //           notification:
                    //               state.notificationList.notifications![index],
                    //         );
                    //       },
                    //       itemCount: state.notificationList.notifications!.length,
                    //       separatorBuilder: (context, index) {
                    //         return Divider();
                    //       },
                    //     ),
                    //   ),
                    // ),

                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.notificationList.notifications!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                              //height: 100,
                              padding: const EdgeInsets.all(12),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Color(0xFFF7F2FA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${state.notificationList.notifications![index].title}",
                                        style: TextStyle(
                                          color: Color(0xFF1D1B1E),
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        DateFormat('dd MMM yyyy hh:mm a').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                            int.parse(state
                                                .notificationList
                                                .notifications![index]
                                                .createdDate !,)
                                            
                                          ),
                                        ),
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: AppColorScheme.primaryColor,
                                          fontSize: 9,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    
                                    "${state.notificationList.notifications![index].description}",
                                    style: TextStyle(
                                      color: Color(0xFF1D1B1E),
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              )),
                        );
                      },
                    ));
              } else {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      translation.of("user.empty_notifications"),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                );
              }
            } else if (state is FetchNotificationListInProgress) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is FetchNotificationListFailed) {
              return
                  // Container(
                  // width: double.infinity,
                  // height: double.infinity,
                  // child:
                  InkWell(
                onTap: () {
                  BlocProvider.of<NotificationListBloc>(context)
                      .add(FetchNotificationList(reFetch: true));
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Click to refresh"),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.refresh)
                    ],
                  ),
                  // )
                  // Center(
                  //   child: Text(
                  //     state.message,
                  //     style: Theme.of(context)
                  //         .textTheme
                  //         .headline6!
                  //         .copyWith(color: Theme.of(context).colorScheme.primary),
                  //   ),
                  // ),
                ),
              );
            } else {
              return Container(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Text(
                    translation.of("unexpected_error_occurred"),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              );
            }
          },
        ));
  }
}
