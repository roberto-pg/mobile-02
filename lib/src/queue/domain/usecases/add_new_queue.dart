import '../entities/queue_entity.dart';
import '../repositories/queue_repository.dart';

abstract class IAddNewQueueUseCase {
  Future<QueueEntity?> call(QueueEntity queueMap);
}

class AddNewQueueUseCase implements IAddNewQueueUseCase {
  final IQueueRepository _repository;

  AddNewQueueUseCase({required IQueueRepository repository})
      : _repository = repository;

  @override
  Future<QueueEntity?> call(QueueEntity queueMap) async {
    final queue = await _repository.addQueue(queueMap);
    return queue;
  }
}
