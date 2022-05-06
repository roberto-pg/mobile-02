import 'package:flutter_test/flutter_test.dart';
import 'package:queue_mob/src/configuration/dio/custom_dio.dart';
import 'package:nock/nock.dart';

void main() {
  setUpAll(() {
    nock.init();
  });

  setUp(() {
    nock.cleanAll();
  });

  test('deve adicionar uma nova Queue', () async {
    final dio = CustomDio();
    final interceptor = nock('http://192.168.15.114:3337/api').post(
      '/create-queue',
      {
        'title': 'Idoso',
        'abbreviation': 'GT',
        'priority': 3,
      },
    )..reply(201, 'Success');

    final response = await dio.post(
      '/create-queue',
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
