import 'package:ceiba_app/domain/entities/address.dart';
import 'package:ceiba_app/domain/entities/company.dart';

class User {
  final int id;
  final String name;
  final String userName;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User(this.id, this.name, this.userName, this.email, this.address, this.phone, this.website, this.company);
  
  @override
  String toString() => '$id, $name, $userName, $email,$address.toString(), $phone, $website, $company.toString()';


  User.fromJson(Map<String,dynamic> json):
    id=json['id'],
    name=json['name'],
    userName=json['username'],
    email=json['email'],
    address= Address.fromJson(json['address']),
    phone=json['phone'],
    website=json['website'],
    company=Company.fromJson(json['company']);
  
  Map<String,dynamic> toJson()=>{
    'id':id,
    'name':name,
    'userName':userName,
    'email':email,
    'address':address,
    'phone':phone,
    'website':website,
    'company':company,
  };
}
