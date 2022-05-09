class LiveDatum {
  LiveDatum({
    required this.symbol,
    required this.ltp,
    required this.ltv,
    required this.percentChange,
    required this.high,
    required this.low,
    required this.open,
    required this.qty,
    required this.previousClose,
    required this.fullName,
    required this.stockinfo,
  });

  String symbol;
  String ltp;
  dynamic ltv;
  String percentChange;
  double high;
  double low;
  double open;
  String qty;
  dynamic previousClose;
  String fullName;
  Stockinfo stockinfo;

  factory LiveDatum.fromJson(Map<String, dynamic> json) => LiveDatum(
        symbol: json["symbol"],
        ltp: json["ltp"],
        ltv: json["ltv"],
        percentChange: json["percent_change"],
        high: json["high"].toDouble(),
        low: json["low"].toDouble(),
        open: json["open"].toDouble(),
        qty: json["qty"],
        previousClose: json["previous_close"],
        fullName: json["full_name"],
        stockinfo: Stockinfo.fromJson(json["stockinfo"]),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "ltp": ltp,
        "ltv": ltv,
        "percent_change": percentChange,
        "high": high,
        "low": low,
        "open": open,
        "qty": qty,
        "previous_close": previousClose,
        "full_name": fullName,
        "stockinfo": stockinfo.toJson(),
      };

  static getMeme({required String query}) {}
}

class Stockinfo {
  Stockinfo({
    required this.symbol,
    required this.fullName,
  });

  String symbol;
  String fullName;

  factory Stockinfo.fromJson(Map<String, dynamic> json) => Stockinfo(
        symbol: json["symbol"],
        fullName: json["full_name"],
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "full_name": fullName,
      };
}
