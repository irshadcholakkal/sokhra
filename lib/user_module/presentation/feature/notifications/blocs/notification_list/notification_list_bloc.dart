import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../base_module/data/entity/models/page_input.dart';
import '../../../../../data/repositories/notification_provider.dart';
import '../../../../../domain/entity/models/notification_list.dart';

part 'notification_list_event.dart';
part 'notification_list_state.dart';

class NotificationListBloc
    extends Bloc<NotificationListEvent, NotificationListState> {
  final _notificationProvider = NotificationProvider();

  NotificationListBloc() : super(NotificationListInitial());

  @override
  Stream<NotificationListState> mapEventToState(
      NotificationListEvent event) async* {
    if (event is FetchNotificationList) {
      yield* _mapFetchNotificationListToState(
        currentState: state,
        reFetch: event.reFetch,
      );
    }
  }

  Stream<NotificationListState> _mapFetchNotificationListToState({
    required NotificationListState currentState,
    required bool reFetch,
  }) async* {
    yield FetchNotificationListInProgress();

    final _pageInput = PageInput(
      limit: 0,
      skip: 0,
    );

    final dataResponse = await _notificationProvider.getAllNotifications(
     // reFetch: reFetch,
    );

    if (dataResponse.hasData) {
      final notificationList = dataResponse.data as NotificationList;
      yield FetchNotificationListSuccess(
        pageInput: _pageInput,
        notificationList: notificationList,
      );
    } else {
      yield FetchNotificationListFailed(
        message: dataResponse.error?.replaceAll(" ", "_").toUpperCase() ?? "",
      );
    }
  }
}
