import '../../common/etc/currency.dart';

class Service {
  final int id;
  final String name;
  final double price;
  final Currencies currency;

  Service({
    required this.id,
    required this.name,
    required this.price,
    required this.currency,
  });
}
