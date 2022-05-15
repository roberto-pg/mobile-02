import 'package:flutter_test/flutter_test.dart';
import 'package:queue_mob/src/queue/domain/usecases/generate_order.dart';
import 'package:queue_mob/src/queue/infra/adapters/json_to_queue.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('deve gerar um nova Order', () async {
    final useCase = GenerateOrderUseCase();
    final queueEntity = JsonToQueue.fromMap(jsonData);

    final result = useCase.call(queueEntity);

    expect(result.orders.length, 1);
    expect(result.orders.first.id, '0001');
    expect(result.orders.first.position, 1);
  });
}
