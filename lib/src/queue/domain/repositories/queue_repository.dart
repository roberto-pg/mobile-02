import '../entities/queue_entity.dart';

abstract class IQueueRepository {
  Future<QueueEntity?> addQueue(QueueEntity queueMap);
  // Future<void> removeQueue(String id);
  // Future<void> removeAllOrders();
  // Future<void> updateQueue(QueueEntity queue);
}
