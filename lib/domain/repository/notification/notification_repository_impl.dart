import 'package:build_flavor/base/model/base_body_model.dart';
import 'package:build_flavor/data/dto/notification_dto.dart';
import 'package:build_flavor/data/repositories/notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  @override
  Future<List<NotificationDto>> getNotificationUnread(BaseBodyModel searchModel) {
    return notificationService.getNotificationUnread(searchModel);
  }

  @override
  Future<List<NotificationDto>> getAllNotification(BaseBodyModel searchModel) {
    return notificationService.getAllNotification(searchModel);
  }

  @override
  Future<bool> readNotification(int notificationId) {
    return notificationService.readNotification(notificationId);
  }
}
