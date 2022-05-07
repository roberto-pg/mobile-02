import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import '../../queue/domain/usecases/add_new_queue.dart';
import '../../queue/domain/usecases/remove_queue.dart';
import '../events/configuration_event.dart';
import '../states/configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  final IAddNewQueueUseCase addNewQueueUseCase;
  final IRemoveQueueUseCase removeQueueUseCase;
  // final IRemoveAllOrdersUseCase removeAllOrdersUseCase;

  ConfigurationBloc({
    required this.addNewQueueUseCase,
    required this.removeQueueUseCase,
    // required this.removeAllOrdersUseCase
  }) : super(InitialConfigurationState()) {
    on<AddNewQueueEvent>(_addNewQueuesEvent, transformer: sequential());
    on<RemoveQueueEvent>(_removeQueueEvent, transformer: sequential());
    // on<RemoveAllOrdersEvent>(_removeAllOrdersEvent, transformer: droppable());
  }

  Future<void> _addNewQueuesEvent(AddNewQueueEvent event, emit) async {
    await addNewQueueUseCase.call(event.queue);
  }

  Future<void> _removeQueueEvent(RemoveQueueEvent event, emit) async {
    await removeQueueUseCase.call(event.queue.id);
  }

  // FutureOr<void> _removeAllOrdersEvent(RemoveAllOrdersEvent event, emit) async {
  //   await removeAllOrdersUseCase.call();
  // }
}
