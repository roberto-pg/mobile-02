import 'package:dio/dio.dart';
import 'package:queue_mob/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_mob/src/queue/infra/adapters/json_to_queue.dart';

import '../../configuration/dio/custom_dio.dart';
import '../infra/datasource/queue_datasource.dart';

class QueuePostgresDatasource implements IQueueDatasource {
  final CustomDio customDio;

  QueuePostgresDatasource({required this.customDio});

  @override
  Future<QueueEntity?> addQueue(Map<String, dynamic> queueMap) async {
    try {
      final response = await customDio.post('/create-queue', data: queueMap);
      QueueEntity queue = JsonToQueue.fromMap(response.data);
      return queue;
    } on DioError catch (error) {
      throw Exception(error.response?.data);
    }
  }

  @override
  Future<String> removeQueue(String id) async {
    try {
      final response = await customDio.delete<String>('/delete/$id');
      return response.data ?? '';
    } on DioError catch (error) {
      throw Exception(error.response?.data);
    }
  }
}

  // @override
  // Future<void> removeAllOrders() async {
  //   // final ref = firestore.collection('queue');

  //   // final snapshot = await ref.get();

  //   // for (var doc in snapshot.docs) {
  //   //   final map = doc.data();
  //   //   map.remove('orders');
  //   //   await doc.reference.set(map);
  //   // }
  // }

  // @override
  // Future<void> updateQueue(Map<String, dynamic> map) async {
  //   // final ref = firestore.collection('queue');

  //   // final doc = ref.doc(map['id']);

  //   // doc.set(map);
  // }


  

