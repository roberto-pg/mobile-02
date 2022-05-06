import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:queue_mob/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_mob/src/queue/infra/adapters/json_to_queue.dart';

import '../../configuration/dio/custom_dio.dart';
import '../infra/datasource/queue_datasource.dart';

class QueuePostgresDatasource implements IQueueDatasource {
  final CustomDio dio;

  QueuePostgresDatasource({required this.dio});

  @override
  Future<QueueEntity?> addQueue(Map<String, dynamic> queueMap) async {
    debugPrint(queueMap.toString());
    try {
      final response = await dio
          .post('/create-queue', data: queueMap);
      debugPrint(response.data.toString());
      QueueEntity queue = JsonToQueue.fromMap(response.data);
      return queue;
    } on DioError catch (error) {
      debugPrint(error.toString());
      throw Exception(error.response?.data);
    }
  }
}
  // @override
  // Future<QueueEntity> addQueue(Map<String, dynamic> queueMap) {
  //   // TODO: implement addQueue
  //   throw UnimplementedError();
  // }
  // @override
  // Future<void> removeQueue(String id) async {
  //   // final ref = firestore.collection('queue');
  //   // await ref.doc(id).delete();
  // }

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


  

