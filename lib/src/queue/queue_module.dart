import 'package:provider/provider.dart';
import '../configuration/dio/custom_dio.dart';
import 'domain/repositories/queue_repository.dart';
import 'domain/usecases/add_new_queue.dart';
import 'domain/usecases/remove_queue.dart';
import 'external/queue_postgres_datasource.dart';
import 'infra/datasource/queue_datasource.dart';
import 'infra/repositories/queue_repository.dart';

final queueModule = [
  Provider<CustomDio>(create: (context) => CustomDio()),
  Provider<IQueueDatasource>(
      create: (context) => QueuePostgresDatasource(customDio: context.read())),
  Provider<IQueueRepository>(
      create: (context) => QueueRepository(datasource: context.read())),
//   // usecase
//   Provider<IGetAllQueuesUseCase>(
//       create: (context) => GetAllQueuesUseCase(repository: context.read())),
  Provider<IAddNewQueueUseCase>(
      create: (context) => AddNewQueueUseCase(repository: context.read())),
  Provider<IRemoveQueueUseCase>(
      create: (context) => RemoveQueueUseCase(repository: context.read())),
//   Provider<IRemoveAllOrdersUseCase>(
//       create: (context) => RemoveAllOrdersUseCase(repository: context.read())),
//   Provider<IGenerateOrderUseCase>(create: (context) => GenerateOrderUseCase()),
//   Provider<IRemoveAllOrdersUseCase>(
//       create: (context) => RemoveAllOrdersUseCase(repository: context.read())),
//   Provider<IUpdateQueueUseCase>(
//       create: (context) => UpdateQueueUseCase(repository: context.read())),
];
