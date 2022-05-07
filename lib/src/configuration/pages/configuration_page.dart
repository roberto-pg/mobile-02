import 'package:flutter/material.dart';
import 'package:queue_mob/src/configuration/blocs/configuration_bloc.dart';
import 'package:queue_mob/src/configuration/dio/custom_dio.dart';
import 'package:queue_mob/src/queue/domain/entities/queue_entity.dart';
import 'package:queue_mob/src/socket/socket_io.dart';
import 'package:provider/provider.dart';

import '../../queue/infra/adapters/json_to_queue.dart';
import '../events/configuration_event.dart';
import '../widgets/add_queue_widget.dart';

class ConfigurationPage extends StatefulWidget {
  final CustomDio _customDio;
  const ConfigurationPage({Key? key, required CustomDio customDio})
      : _customDio = customDio,
        super(key: key);

  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  var socket = InitSocket().socket;
  List<QueueEntity> listQueues = [];

  @override
  void initState() {
    super.initState();
    widget._customDio.get('/queues');
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<ConfigurationBloc>();

    socket.on('load_queues', (queues) {
      List list = queues as List;
      listQueues = list.map((queue) => JsonToQueue.fromMap(queue)).toList();
      if (mounted) setState(() {});
    });

    return Scaffold(
      body: Scaffold(
        appBar: AppBar(title: const Text('Configuration Page')),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text('FILAS'),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => const AddQueueWidget());
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: listQueues.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          '${listQueues[index].title} - ${listQueues[index].abbreviation}'),
                      subtitle:
                          Text('${listQueues[index].priority} de prioridade'),
                      trailing: IconButton(
                        onPressed: () {
                          bloc.add(RemoveQueueEvent(queue: listQueues[index]));
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.redAccent,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text('CONTROLE'),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  // bloc.add(RemoveAllOrdersEvent());
                },
                child: const Text('Reiniciar filas'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
