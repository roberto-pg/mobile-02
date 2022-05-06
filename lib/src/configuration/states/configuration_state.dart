import '../models/queue_model.dart';

abstract class ConfigurationState {}

class InitialConfigurationState extends ConfigurationState {}

class LoadingConfigurationState extends ConfigurationState {}

class LoadedConfigurationState extends ConfigurationState {
  final List<QueueModel> queues;
  LoadedConfigurationState(this.queues);
}

class ExceptionConfigurationState extends ConfigurationState {
  final String message;
  ExceptionConfigurationState(this.message);
}
