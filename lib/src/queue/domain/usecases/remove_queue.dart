import '../repositories/queue_repository.dart';

abstract class IRemoveQueueUseCase {
  Future<String> call(String id);
}

class RemoveQueueUseCase implements IRemoveQueueUseCase {
  final IQueueRepository repository;

  RemoveQueueUseCase({required this.repository});

  @override
  Future<String> call(String id) async {
    final queueId = await repository.removeQueue(id);
    return queueId;
  }
}
