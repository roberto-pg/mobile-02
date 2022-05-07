import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nock/nock.dart';

void main() {
  setUpAll(() {
    nock.init();
  });

  setUp(() {
    nock.cleanAll();
  });

  test('deve adicionar uma nova Queue', () async {
    final dio = Dio();
    String url = const String.fromEnvironment('httpUrl');

    final interceptor = nock(url).post(
      '/create-queue',
      {
        'title': 'Idoso',
        'abbreviation': 'GT',
        'priority': 3,
      },
    )..reply(201, 'Success');

    final response = await dio.post(
      '$url/create-queue',
      data: {
        'title': 'Idoso',
        'abbreviation': 'GT',
        'priority': 3,
      },
    );

    expect(response.statusCode, 201);
    expect(interceptor.body, 'Success');
    expect(interceptor.isDone, true);
  });
}
