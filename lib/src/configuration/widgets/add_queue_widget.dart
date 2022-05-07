import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../blocs/configuration_bloc.dart';
import '../events/configuration_event.dart';
import '../models/queue_model.dart';

class AddQueueWidget extends StatelessWidget {
  const AddQueueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var queue = QueueModel.empty();

    return AlertDialog(
      title: const Text('Nova fila'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              onChanged: (value) {
                queue = queue.copyWith(title: value);
              },
              decoration: const InputDecoration(
                  labelText: 'Título', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextFormField(
              onChanged: (value) {
                queue = queue.copyWith(abbreviation: value);
              },
              decoration: const InputDecoration(
                  labelText: 'Abreviação', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextFormField(
              onChanged: (value) {
                queue = queue.copyWith(priority: int.tryParse(value));
              },
              decoration: const InputDecoration(
                  labelText: 'Prioridade', border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar')),
        TextButton(
            onPressed: () {
              context
                  .read<ConfigurationBloc>()
                  .add(AddNewQueueEvent(queue: queue));
              Navigator.pop(context);
            },
            child: const Text('Adicionar')),
      ],
    );
  }
}
