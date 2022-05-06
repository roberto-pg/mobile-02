import '../../queue/domain/entities/queue_entity.dart';

abstract class ConfigurationEvent {}

class AddNewQueueEvent implements ConfigurationEvent {
  final QueueEntity queue;

  AddNewQueueEvent({required this.queue});
}

// class RemoveQueueEvent implements ConfigurationEvent {
//   final QueueEntity queue;

//   RemoveQueueEvent({required this.queue});
// }

// class RemoveAllOrdersEvent implements ConfigurationEvent {}
