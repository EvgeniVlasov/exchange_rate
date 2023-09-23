import 'package:dio/dio.dart';
import 'package:exchange_rates/models/rates_response.dart';

class RemoteDataProvider {
  final Dio _client;
  static final BaseOptions _clientOptions = BaseOptions(
    baseUrl: 'http://api.exchangeratesapi.io',
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    contentType: 'application/json',
  );

  RemoteDataProvider()
      : _client = Dio(_clientOptions)
          ..interceptors.addAll(
            {
              LogInterceptor(
                requestBody: true,
                responseBody: true,
              ),
            },
          ),
        super();

  static const _apiKey = 'c25f31d4079c8cddcc926d2a7480e393';

  static const exchangeRatesMethod = '/v1/latest';

  Future<RatesResponse> getExchangeRates() async {
    try {
      final response = await _client
          .get(exchangeRatesMethod, queryParameters: {'access_key': _apiKey});
      return RatesResponse.fromMap(response.data);
    } catch (_) {
      return RatesResponse(isSuccess: false);
    }
  }
}
