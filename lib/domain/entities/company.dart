class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company(this.name, this.catchPhrase, this.bs);

  @override
  String toString() => '$name, $catchPhrase, $bs';

  Company.fromJson(Map<String,dynamic> json):
    name=json['name'],
    catchPhrase=json['catchPhrase'],
    bs=json['bs'];
  
  Map<String, dynamic> toJson() => {
    'name':name,
    'catchPhrase':catchPhrase,
    'bs':bs,
  };
}