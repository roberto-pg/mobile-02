import '../entities/queue_entity.dart';

abstract class IQueueRepository {
  Future<QueueEntity?> addQueue(QueueEntity queueMap);
  Future<String> removeQueue(String id);
  // Future<void> removeAllOrders();
  // Future<void> updateQueue(QueueEntity queue);
}
