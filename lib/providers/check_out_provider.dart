import 'dart:convert';
import 'dart:developer';
import 'package:ebike_flutter/constant.dart';
import 'package:ebike_flutter/data_model/check_out_model.dart';
import 'package:ebike_flutter/local_save.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOutProvider with ChangeNotifier {
  TextEditingController referralCodeController =
      TextEditingController(text: '');
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController addressController = TextEditingController(text: '');
  TextEditingController postcodeController = TextEditingController(text: '');
  TextEditingController cityController = TextEditingController(text: '');
  TextEditingController stateController = TextEditingController(text: '');
  TextEditingController phoneNumberController = TextEditingController(text: '');
  String _countryCode = '';
  bool _isDeliverySelected = false;
  final List<DeliveryModel> _deliveryAddressList = [];
  List<DeliveryModel> _getDeliveryAddressList = [];
  DeliveryModel? _radioButtonGroupValue;
  PickUpModel _radioButtonPickUpModelValue = pickUpAddressList.first;

  static List<PickUpModel> pickUpAddressList = [
    PickUpModel(
      branch: 'Starwheels HQ',
      address:
          '47-2F, 2nd Floor, Jalan Setia Perdana U13/BD, Seria 88 Business Centre. 40170 Shah Alam, Selangor.',
    ),
    PickUpModel(
      branch: 'Starwheels Subang',
      address:
          'G13A, Ground Floor, Palazzo Mall, Persiaran Kewajipan, USJ 19, 47620 Subang Jaya, Selangor.',
    ),
    PickUpModel(
      branch: 'Starwheels Pahang',
      address: 'B2624 Jalan Berserah, 25300 Kuantan, Pahang.',
    ),
    PickUpModel(
      branch: 'Starwheels Johor',
      address:
          'Warung Warisan Pak Ajis, Jalan Persiaran Teratai, Taman Cempaka, 81200 Johor Bahru, Johor.',
    ),
    PickUpModel(
      branch: 'Starwheels Penang',
      address:
          'No, 488B-G-02, Ground Floor, Midlands Park Centre, Jalan Burma, 10350 Penang.',
    ),
    PickUpModel(
      branch: 'Starwheels Perak',
      address:
          'No. 20 Ground Floor, Jalan Stesen Medan Kamunting, 34600 Kamunting, Perak.',
    ),
  ];

  void setCountryCode(String val) {
    _countryCode = val;
  }

  String get getCountryCode => _countryCode;

  void setIsDeliverySelected(bool val) {
    _isDeliverySelected = val;
    notifyListeners();
  }

  bool get isDeliverySelected => _isDeliverySelected;

  Future<void> addAddress({
    required String name,
    required String number,
    required String address,
    required String postcode,
    required String city,
    required String state,
  }) async {
    try {
      DeliveryModel deliveryModel = DeliveryModel(
        name: name,
        contact: number,
        address: '$address $postcode $city $state',
      );

      _deliveryAddressList.add(deliveryModel);

      await Local.setString(
          Constant.deliveryAddress, jsonEncode(_deliveryAddressList));
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getAddress() async {
    try {
      String? address = await Local.getString(Constant.deliveryAddress) ?? '';

      List<Map<String, dynamic>> addressList = List.from(jsonDecode(address));

      List<DeliveryModel> data =
          DeliveryModelList.fromList(addressList).deliveryModelList!;

      _getDeliveryAddressList = data;

      _radioButtonGroupValue = _getDeliveryAddressList.first;

      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  List<DeliveryModel> get getDeliveryAddressList => _getDeliveryAddressList;

  void setRadioButtonGroupValue(DeliveryModel val) {
    _radioButtonGroupValue = val;

    notifyListeners();
  }

  DeliveryModel get radioButtonGroupValue => _radioButtonGroupValue!;

  void setPickUpRadioButtonGroupValue(PickUpModel val) {
    _radioButtonPickUpModelValue = val;

    notifyListeners();
  }

  PickUpModel get radioButtonPickUpGroupValue => _radioButtonPickUpModelValue;
}
