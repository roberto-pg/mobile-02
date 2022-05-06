import 'package:queue_mob/src/queue/domain/entities/queue_entity.dart';

abstract class IQueueDatasource {
  Future<QueueEntity?> addQueue(Map<String, dynamic> queueMap);
  // Future<void> removeQueue(String id);
  // Future<void> removeAllOrders();
  // Future<void> updateQueue(Map<String, dynamic> map);
}
