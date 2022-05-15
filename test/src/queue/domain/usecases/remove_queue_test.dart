import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_mob/src/queue/infra/adapters/json_to_queue.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('deve remover a queue', () async {
    final useCase = IRemoveQueueUseCaseMock();

    final queue = JsonToQueue.fromMap(jsonData);

    when(() => useCase.call(queue.id))
        .thenAnswer((_) async => Future.value(queue.id));

    final result = await useCase.call(queue.id);

    expect(useCase.call(queue.id), completes);
    expect(result, '07a9aa0e-09b5-471d-b81b-bb4bfdd5d000');
  });
}
