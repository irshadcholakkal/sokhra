part of 'notification_list_bloc.dart';

abstract class NotificationListState extends Equatable {
  const NotificationListState();

  @override
  List<Object?> get props => [];
}

class NotificationListInitial extends NotificationListState {}

class FetchNotificationListInProgress extends NotificationListState {}

class FetchNotificationListSuccess extends NotificationListState {
  final PageInput pageInput;
  final NotificationList notificationList;

  const FetchNotificationListSuccess({
    required this.pageInput,
    required this.notificationList,
  });

  @override
  List<Object?> get props => [
        pageInput,
        notificationList,
      ];
}

class FetchNotificationListFailed extends NotificationListState {
  final String message;

  const FetchNotificationListFailed({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
