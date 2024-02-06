// ignore_for_file: file_names

// Flutter imports:
import 'dart:convert';

import 'package:flutter/foundation.dart';

// Project imports:
import 'package:onestopservices/models/provider/provider_create.dart';
import 'package:onestopservices/models/provider/provider_create_return.dart';
import 'package:onestopservices/models/provider/provider_search.dart';
import 'package:onestopservices/models/provider/provider.dart';
import 'package:onestopservices/models/provider/provider_update.dart';
import 'package:onestopservices/services/serviceprovider/providerService.dart';
import 'package:onestopservices/services/sharedpref_service.dart';

class ServiceProviderFactory with ChangeNotifier {
  List<ServiceProvider> serviceproviders = [];
  bool isNextable = false;
  bool isPrevious = false;
  int currentPage = 1;
  int totalPages = 0;

  String? adminId;
  String keyAdminId = "storedAdmin";
  SharedPref sharedPref = SharedPref();
  ProviderCreateReturn? provider;

  get userList {
    return [...serviceproviders];
  }

  getProviderId(id) {
    return serviceproviders.firstWhere((res) => res.id == id);
  }

  Future<ProviderCreateReturn> getUserById(providerId) async {
    TaskerService req = TaskerService();
    ProviderCreateReturn userSearch =
        await req.getServiceProviderById(providerId);
    provider = userSearch;
    notifyListeners();
    return userSearch;
  }

  Future<ProviderCreateReturn?> getUserByTaskerNumber(taskerNumber) async {
    TaskerService req = TaskerService();
    ProviderCreateReturn? userSearch =
        await req.getServiceProviderByTaskerNumber(taskerNumber);
    provider = userSearch;
    notifyListeners();
    return userSearch;
  }

  Future<dynamic> uploadImage() async {
    TaskerService requests = TaskerService();
    var image = await requests.uploadImage();

    notifyListeners();
    return image;
  }

  Future<String> getTaskerLogo(taskerLogo) async {
    TaskerService req = TaskerService();
    Uint8List logo = await req.getTaskerLogo(taskerLogo);
    notifyListeners();
    return base64Encode(logo);
  }

  Future<List<ServiceProvider>?> getAllServiceProviders(page) async {
    TaskerService req = TaskerService();
    ProviderSearch? userSearch = await req.getServiceProviders(page);

    if (userSearch != null) {
      serviceproviders = userSearch.data!;
      isNextable = userSearch.page! < userSearch.pages!;
      isPrevious = (userSearch.page! > 1);
      totalPages = userSearch.pages!;
    notifyListeners();

      return userSearch.data;
    } else {
    notifyListeners();

      return null;
    }
  }

  Future<void> goNext() async {
    if (isNextable) {
      await getAllServiceProviders(++currentPage);
      notifyListeners();

    }
  }

  Future<void> goPrevious() async {
    if (isPrevious) {
      await getAllServiceProviders(--currentPage);
      notifyListeners();

    }
  }

  Future<ProviderCreate> createServiceProvider({
    name,
    username,
    gender,
    birthdate,
    email,
    phone,
    avatar,
    password,
    profileDetails,
    availabilityAddress,
    status,
    taskerStatus,
    experienceId,
    skill,
    categoryId,
  }) async {
    adminId = await sharedPref.read(keyAdminId);
    final provider = ProviderCreate(
      username: username,
      gender: gender,
      birthdate: birthdate,
      email: email,
      phone: phone,
      avatar: avatar,
      password: password,
      profile_details: profileDetails,
      availability_address: availabilityAddress,
      experienceId: experienceId,
      name: name,
      status: status,
      skillattachments: skill,
      taskerStatus: taskerStatus,
      categoryId: categoryId,
      createdBy: adminId,
    );
    TaskerService requests = TaskerService();
    await requests.createServiceProvider(provider);

    notifyListeners();
    return provider;
  }

  Future<ProviderUpdate?> updateServiceProvider(updatedProvider) async {
    TaskerService requests = TaskerService();
    ProviderUpdate? provider =
        await requests.updateServiceProvider(updatedProvider);

    notifyListeners();
    return provider;
  }

  Future deleteServiceProvider(providerId) async {
    TaskerService requests = TaskerService();
    final result = await requests.deleteServiceProvider(providerId);

    notifyListeners();
    return result;
  }

  Future<dynamic> verifyProvider(providerId) async {
    TaskerService requests = TaskerService();
    ProviderUpdate? result = await requests.verifyProvider(providerId);

    notifyListeners();
    return result;
  }
}
