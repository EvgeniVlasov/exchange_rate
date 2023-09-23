class RatesResponse {
  final bool? isSuccess;
  final int? timestamp;
  final String? base;
  final String? date;
  final Map<String, dynamic>? rates;

  RatesResponse(
      {this.isSuccess, this.timestamp, this.base, this.date, this.rates});

  factory RatesResponse.fromMap(Map<String, dynamic> map) => RatesResponse(
      isSuccess: map['success'],
      timestamp: map['timestamp'],
      base: map['base'],
      date: map['date'],
      rates: map['rates']);
}
