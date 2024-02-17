class NotificationSchema {
  // final getNotifications = """
  //   query getNotifications(\$pageInput: PageInput){
  //     getNotifications(pageInput: \$pageInput){
  //       notifications{
  //         _id
  //         title
  //         message
  //       }
  //     }
  //   }
  // """;

  static const String _notificationFields = """
  _id
  title
  description
  createdDate
  """;

  static const String _notification = """
  notifications{
  $_notificationFields
  }
  """;

  final getNotifications = """
  query getNotificationOfCurrentUser(){
  getNotificationOfCurrentUser(){
  $_notification
  totalCount
  }
  }
  """;


  final getAllNotifications="""
query getAllNotifications(\$input:PageInput){
  getAllNotifications(input:\$input){
     $_notification
     totalCount


  }
}
""";


















}
