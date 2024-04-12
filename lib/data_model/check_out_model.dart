class PickUpModel {
  final String? branch;
  final String? address;

  PickUpModel({this.branch, this.address});
}

class DeliveryModelList {
  final List<DeliveryModel>? deliveryModelList;

  DeliveryModelList({this.deliveryModelList});

  factory DeliveryModelList.fromList(List? list) {
    return DeliveryModelList(
      deliveryModelList: list?.map((e) => DeliveryModel.fromJson(e)).toList(),
    );
  }
}

class DeliveryModel {
  final String name;
  final String contact;
  final String address;

  DeliveryModel({
    required this.name,
    required this.contact,
    required this.address,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      name: json['name'],
      contact: json['contact'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'contact': contact,
        'address': address,
      };
}
