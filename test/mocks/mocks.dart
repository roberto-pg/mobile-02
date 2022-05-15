import 'package:dio/dio.dart' as dio;
import 'package:mocktail/mocktail.dart';
import 'package:queue_mob/src/configuration/dio/custom_dio.dart';
import 'package:queue_mob/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_mob/src/queue/domain/repositories/queue_repository.dart';
import 'package:queue_mob/src/queue/domain/usecases/add_new_queue.dart';
import 'package:queue_mob/src/queue/domain/usecases/remove_queue.dart';
import 'package:queue_mob/src/queue/infra/datasource/queue_datasource.dart';

class QueueRepositoryMock extends Mock implements IQueueRepository {}

class QueueEntityMock extends Mock implements QueueEntity {}

class IQueueDatasourceMock extends Mock implements IQueueDatasource {}

class DioMock extends Mock implements CustomDio {}

class MockResponse extends Mock implements dio.Response {}

class IAddNewQueueUseCaseMock extends Mock implements IAddNewQueueUseCase {}

class IRemoveQueueUseCaseMock extends Mock implements IRemoveQueueUseCase {}

Map<String, Object> jsonData = {
  'id': '07a9aa0e-09b5-471d-b81b-bb4bfdd5d000',
  'title': 'Idoso',
  'abbreviation': 'GT',
  'priority': 3,
};
