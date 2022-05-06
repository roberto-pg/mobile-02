import 'package:socket_io_client/socket_io_client.dart';

class InitSocket {
  Socket socket = io(
      const String.fromEnvironment('socketIoUrl'),
      OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build());
}
