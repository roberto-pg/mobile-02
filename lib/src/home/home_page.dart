import 'package:flutter/material.dart';
import '../socket/socket_io.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var socket = InitSocket().socket;

  @override
  void initState() {
    super.initState();
    socket.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/config'),
                child: const Text('Configurações')),
          )
        ],
      ),
    );
  }
}
