import 'package:flutter_test/flutter_test.dart';
import 'package:queue_mob/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_mob/src/queue/domain/value_objects/order.dart';
import 'package:queue_mob/src/queue/infra/adapters/json_to_queue.dart';

void main() {
  test('deve converter um Map em um objeto do tipo QueueEntity', () async {
    final queue = JsonToQueue.fromMap({
      'id': 'asdfg',
      'title': 'Cadeirante',
      'priority': 1,
      'abbreviation': 'CD',
      "orders": [
        {
          'id': 'asdfg',
          'position': 1,
          'status': 'attending',
          'timestamp': '2022-03-21 18:37:30'
        }
      ]
    });

    expect(queue, isA<QueueEntity>());
    expect(queue.title, 'Cadeirante');
    expect(queue.priority, 1);
    expect(queue.orders.first.status, OrderStatus.attending);
  });

  test('deve converter um objeto do tipo QueueEntity em Map', () {
    final queue = QueueEntity(
        id: 'asdfg',
        title: 'Cadeirante',
        priority: 1,
        abbreviation: 'CD',
        orders: [
          Order(
            id: 'gfdsa',
            position: 1,
            timestamp: DateTime.now(),
            status: OrderStatus.waiting,
          )
        ]);

    final map = JsonToQueue.toMap(queue);

    expect(map['id'], 'asdfg');
    expect(map['title'], 'Cadeirante');
    expect(map['orders'][0]['status'], 'waiting');
  });
}
