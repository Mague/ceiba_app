class Geo{
  final String lat;
  final String lng;

  Geo(this.lat, this.lng);

  @override
  String toString() => '$lat, $lng';

  Geo.fromJson(Map<String, dynamic> json):
    lat=json['lat'],
    lng=json['lng'];
  
  Map<String, dynamic> toJson() => {
    'lat': lat,
    'lng': lng,
  };
}