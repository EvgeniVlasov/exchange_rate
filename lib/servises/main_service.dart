import 'package:exchange_rates/providers/local_storage_provider.dart';
import 'package:exchange_rates/providers/remote_data_provider.dart';
import 'package:get/get.dart';

final class MainService extends GetxService {
  final RemoteDataProvider _remoteDataProvider;
  final LocalStorageProvider _localStorageProvider;
  Map<String, dynamic>? rates;

  MainService(
      {required RemoteDataProvider remoteDataProvider,
      required LocalStorageProvider localStorageProvider})
      : _remoteDataProvider = remoteDataProvider,
        _localStorageProvider = localStorageProvider;

  Future<List<String>?> getExchangeRates() async {
    final result = await _remoteDataProvider.getExchangeRates();
    if (result.isSuccess == true) {
      rates = result.rates;
      await _localStorageProvider.saveRates(rates ?? {});
      return result.rates?.keys.toList();
    } else {
      return _getRatesInCache();
    }
  }

  List<String>? _getRatesInCache() {
    final ratesInCache = _localStorageProvider.getRates();
    rates = ratesInCache;
    return ratesInCache?.keys.toList();
  }

  String makeACalculation(
      {required String input,
      required String dividendKey,
      required String divisorKey}) {
    try {
      if (input.contains(',')) {
        input = input.replaceAll(',', '.');
      }
      final value = double.parse(input);
      final coefficient = rates?[dividendKey] / rates?[divisorKey];
      final valueConvector = value * coefficient;
      return valueConvector.toString();
    } catch (_) {
      return '';
    }
  }
}
