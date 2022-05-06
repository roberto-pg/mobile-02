import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queue_mob/src/configuration/blocs/configuration_bloc.dart';

final configurationModule = [
  BlocProvider(
      create: (context) => ConfigurationBloc(
            addNewQueueUseCase: context.read(),
          ))
];
