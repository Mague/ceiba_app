import 'package:ceiba_app/domain/entities/geo.dart';

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address(this.street, this.suite, this.city, this.zipcode, this.geo);

  @override
  String toString() => '$street, $suite, $city, $zipcode, $geo';

  Address.fromJson(Map<String,dynamic> json):
    street=json['street'],
    suite=json['suite'],
    city=json['city'],
    zipcode=json['zipcode'],
    geo=Geo.fromJson(json['geo']);

  Map<String, dynamic> toJson() => {
    'street':street,
    'suite':suite,
    'city':city,
    'zipcode':zipcode,
    'geo':geo,
  };
}