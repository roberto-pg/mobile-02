import 'package:flutter_test/flutter_test.dart';
import 'package:queue_mob/src/queue/domain/value_objects/order.dart';
import 'package:queue_mob/src/queue/infra/adapters/json_to_order.dart';

void main() {
  test('deve converter um Map em um objeto do tipo Order', () async {
    final order = JsonToOrder.fromMap({
      'id': 'qwert',
      'position': 2,
      'status': 'attending',
      'timestamp': '2022-03-21 18:37:30'
    });

    expect(order, isA<Order>());
    expect(order.status, OrderStatus.attending);
  });

  test('deve converter um objeto do tipo Order em um Map', () {
    final order = Order(
      id: 'oioioio',
      position: 3,
      timestamp: DateTime.now(),
      status: OrderStatus.attending,
    );

    final map = JsonToOrder.toMap(order);

    expect(map['position'], 3);
    expect(map['status'], 'attending');
    expect(map['id'], 'oioioio');
  });
}
