import '../../domain/entities/queue_entity.dart';
import '../../domain/repositories/queue_repository.dart';
import '../adapters/json_to_queue.dart';
import '../datasource/queue_datasource.dart';

class QueueRepository implements IQueueRepository {
  final IQueueDatasource datasource;

  QueueRepository({required this.datasource});

  @override
  Future<QueueEntity?> addQueue(QueueEntity queueMap) async {
    final map = JsonToQueue.toMap(queueMap);
    final queue = await datasource.addQueue(map);
    return queue;
  }

  // @override
  // Future<void> removeQueue(String id) async {
  //   await datasource.removeQueue(id);
  // }

  // @override
  // Future<void> removeAllOrders() async {
  //   await datasource.removeAllOrders();
  // }

  // @override
  // Future<void> updateQueue(QueueEntity queue) async {
  //   final map = JsonToQueue.toMap(queue);
  //   await datasource.updateQueue(map);
  // }
}
