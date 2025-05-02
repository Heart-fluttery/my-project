import 'dart:typed_data';

class Address {
  final int? id;
  final String name;
  final String phone;
  final String address;
  final String relation;
  final Uint8List image;

  // Constuctor
  Address(
    {
      this.id,
      required this.name,
      required this.phone,
      required this.address,
      required this.relation,
      required this.image,
    }
  );

  Address.fromMap(Map<String, dynamic> res)
  // Map<컬럼 네임, 데이터>
  : id = res['id'],
    name = res['name'],
    phone = res['phone'],
    address = res['address'],
    relation = res['relation'],
    image = res['image'];
}