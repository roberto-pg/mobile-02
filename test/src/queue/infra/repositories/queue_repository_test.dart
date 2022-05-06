import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_mob/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_mob/src/queue/infra/repositories/queue_repository.dart';

import '../../../../mocks/mocks.dart';

void main() {
  test('deve adicionar um nova queue', () async {
    final datasource = IQueueDatasourceMock();
    const queue = QueueEntity(
        id: 'oooooo',
        title: 'Gestante',
        abbreviation: 'GT',
        priority: 3,
        orders: []);

    when(() => datasource.addQueue(any())).thenAnswer((_) => Future.value());
    final repository = QueueRepository(datasource: datasource);

    expect(repository.addQueue(queue), completes);
  });
}
