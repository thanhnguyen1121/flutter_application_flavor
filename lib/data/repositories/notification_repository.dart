
import 'package:build_flavor/base/model/base_body_model.dart';
import 'package:build_flavor/data/datasource/remote/notification_service.dart';
import 'package:build_flavor/data/dto/notification_dto.dart';

abstract class NotificationRepository {
  NotificationService notificationService = NotificationService();

  Future<List<NotificationDto>> getNotificationUnread(BaseBodyModel searchModel);

  Future<List<NotificationDto>> getAllNotification(BaseBodyModel searchModel);

  Future<bool> readNotification(int notificationId);
}
