import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:queue_mob/src/configuration/blocs/configuration_bloc.dart';
import 'package:queue_mob/src/configuration/events/configuration_event.dart';
import 'package:queue_mob/src/configuration/states/configuration_state.dart';
import '../../../mocks/mocks.dart';

void main() {
  final entity = QueueEntityMock();
  late IAddNewQueueUseCaseMock addNewQueueUseCase;
  late IRemoveQueueUseCaseMock removeQueueUseCase;
  late ConfigurationBloc bloc;

  setUp(() {
    addNewQueueUseCase = IAddNewQueueUseCaseMock();
    removeQueueUseCase = IRemoveQueueUseCaseMock();
    bloc = ConfigurationBloc(
        addNewQueueUseCase: addNewQueueUseCase,
        removeQueueUseCase: removeQueueUseCase);
  });

  blocTest<ConfigurationBloc, ConfigurationState>(
    'add new queues',
    build: () {
      when(() => addNewQueueUseCase.call(entity))
          .thenAnswer((_) => Future.value());
      return bloc;
    },
    act: (bloc) => bloc.add(AddNewQueueEvent(queue: entity)),
    expect: () => [],
  );
}
