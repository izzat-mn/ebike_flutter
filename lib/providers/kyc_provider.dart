import 'dart:io';
import 'package:flutter/material.dart';

class KYCProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController addressController = TextEditingController(text: '');
  TextEditingController postcodeController = TextEditingController(text: '');
  TextEditingController cityController = TextEditingController(text: '');
  TextEditingController stateController = TextEditingController(text: '');

  TextEditingController occupationController = TextEditingController(text: '');
  TextEditingController compNameController = TextEditingController(text: '');
  TextEditingController compCountryCodeController =
      TextEditingController(text: '60');
  TextEditingController compMobileNumController = TextEditingController();
  TextEditingController compAddressController = TextEditingController(text: '');
  TextEditingController compPostcodeController =
      TextEditingController(text: '');
  TextEditingController compCityController = TextEditingController(text: '');
  TextEditingController compStateController = TextEditingController(text: '');

  TextEditingController emergContOneNameController =
      TextEditingController(text: '');
  TextEditingController emergContOneCountryCodeController =
      TextEditingController(text: '60');
  TextEditingController emergContOneMobileNumController =
      TextEditingController();
  TextEditingController emergContOneRelationshipController =
      TextEditingController(text: '');

  TextEditingController emergContTwoNameController =
      TextEditingController(text: '');
  TextEditingController emergContTwoCountryCodeController =
      TextEditingController(text: '60');
  TextEditingController emergContTwoMobileNumController =
      TextEditingController();
  TextEditingController emergContTwoRelationshipController =
      TextEditingController(text: '');

  TextEditingController emergContThreeNameController =
      TextEditingController(text: '');
  TextEditingController emergContThreeCountryCodeController =
      TextEditingController(text: '60');
  TextEditingController emergContThreeMobileNumController =
      TextEditingController();
  TextEditingController emergContThreeRelationshipController =
      TextEditingController(text: '');

  PageController pageController = PageController(initialPage: 0);
  int _pageViewIndex = 0;
  File? _frontIDFile;
  File? _backIDFile;
  File? _selfieIDFile;
  File? _addressFile;
  bool _agreePrivacyPolicy = false;

  List<Map<String, String>> kycSample = [
    {"name": "ID Front View", "image": "assets/images/id_front_sample.png"},
    {"name": "ID Back View", "image": "assets/images/id_back_sample.png"},
    {
      "name": "Selfie With ID",
      "image": "assets/images/selfie_with_id_sample.png"
    },
    {
      "name": "Proof of Address",
      "image": "assets/images/proof_address_sample.png"
    },
  ];

  List<Map<String, String>> imageNeeded = [
    {
      "index": "0",
      "name": "ID Front View",
      "description": "",
      "condition": "id_front"
    },
    {
      "index": "1",
      "name": "ID Back View",
      "description": "",
      "condition": "id_back"
    },
    {
      "index": "2",
      "name": "Selfie With ID",
      "description":
          "Please position your face in the center to ensure your whole face is captured, not blurry, cut off, or covered by the light",
      "condition": "selfie"
    },
    {
      "index": "3",
      "name": "Proof of Address",
      "description": "Upload any statement with name & address",
      "condition": "address"
    },
  ];

  void resetStatus() {
    emailController.text = '';
    addressController.text = '';
    postcodeController.text = '';
    cityController.text = '';
    stateController.text = '';
    occupationController.text = '';
    _pageViewIndex = 0;
    _frontIDFile = null;
    _backIDFile = null;
    notifyListeners();
  }

  void setPageViewIndex(int index) {
    _pageViewIndex = index;
    notifyListeners();
  }

  int get getPageViewIndex => _pageViewIndex;

  void setImageFile(String filePath, String imageCondition) {
    if (imageCondition == 'id_front') {
      _frontIDFile = File(filePath);
      notifyListeners();
    } else if (imageCondition == 'id_back') {
      _backIDFile = File(filePath);
      notifyListeners();
    } else if (imageCondition == 'selfie') {
      _selfieIDFile = File(filePath);
      notifyListeners();
    } else if (imageCondition == 'address') {
      _addressFile = File(filePath);
      notifyListeners();
    }
  }

  Future<void> deleteImageFile(String filePath, String imageCondition) async {
    if (imageCondition == 'id_front') {
      _frontIDFile = null;
      notifyListeners();
    } else if (imageCondition == 'id_back') {
      _backIDFile = null;
      notifyListeners();
    } else if (imageCondition == 'selfie') {
      _selfieIDFile = null;
      notifyListeners();
    } else if (imageCondition == 'address') {
      _addressFile = null;
      notifyListeners();
    }
  }

  File? get getFrontIDFile => _frontIDFile;
  File? get getBackIDFile => _backIDFile;
  File? get getSelfieIDFile => _selfieIDFile;
  File? get getAddressFile => _addressFile;

  void agreePrivacyPolicy(bool val) {
    _agreePrivacyPolicy = val;
    notifyListeners();
  }

  bool? get getAgreePrivacyPolicy => _agreePrivacyPolicy;
}
