import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_mob/src/queue/domain/usecases/add_new_queue.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('deve adicionar uma nova QueueEntity', () async {
    final repository = QueueRepositoryMock();
    final queue = QueueEntityMock();

    when(() => repository.addQueue(queue)).thenAnswer((_) => Future.value());
    final useCase = AddNewQueueUseCase(repository: repository);

    expect(useCase.call(queue), completes);
  });
}
