// ignore_for_file: prefer_typing_uninitialized_variables
// Project imports:
import 'package:file_picker/file_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:onestopservices/controllers/route_controller.dart';
import 'package:onestopservices/controllers/sidebar_controller.dart';
import 'package:onestopservices/models/address/address.dart';
import 'package:onestopservices/models/location/location.dart';
import 'package:onestopservices/models/phone/phone.dart';
import 'package:onestopservices/services/main_api_endpoint.dart';
import 'package:onestopservices/services/toaster_service.dart';
import 'package:onestopservices/controllers/menu_controller.dart' as custom;

import 'package:onestopservices/services/customer/customerFactory.dart';
import 'package:onestopservices/services/variables_service.dart';
import 'package:onestopservices/themes/app_theme.dart';
import 'package:onestopservices/themes/app_responsive.dart';
import 'package:onestopservices/services/sharedpref_service.dart';
import 'package:country_picker/country_picker.dart';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CreateCustomer extends StatefulWidget {
  const CreateCustomer({Key? key}) : super(key: key);

  @override
  CreateCustomerState createState() => CreateCustomerState();
}

class CreateCustomerState extends State<CreateCustomer> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipcodeController = TextEditingController();
  final _line1Controller = TextEditingController();
  final _line2Controller = TextEditingController();
  final _dialingController = TextEditingController();
  final _phoneController = TextEditingController();
  final _pictureController = TextEditingController();

  int userStatus = 1;

  String profilePic = '';
  dynamic latitude;
  dynamic longitude;

  late List<bool> checkedList;
  Phone phone = Phone();
  Address address = Address();
  List<Location> coordinates = [];
  VariableService getProperty = VariableService();

  SharedPref sharedPref = SharedPref();
  late GlobalKey<FormState> _formKeyCreateUser;
  var imagePath, imageName, imageSize, imageStream;
  PlatformFile? objFile;
  String key = 'storedToken';

  @override
  void initState() {
    super.initState();
    profilePic = ApiEndPoint.appLogo;
    _formKeyCreateUser = GlobalKey();
    getProperty.isActive = true;
  }

  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _emailController.dispose();
  //   _usernameController.dispose();
  //   _passwordController.dispose();
  //   _passwordController.dispose();
  //   _countryController.dispose();
  //   _cityController.dispose();
  //   _stateController.dispose();
  //   _zipcodeController.dispose();
  //   _line2Controller.dispose();
  //   _line1Controller.dispose();
  //   _dialingController.dispose();
  //   _phoneController.dispose();
  //   _pictureController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      key: Provider.of<custom.MenuController>(context, listen: false)
          .scaffoldKey,
      backgroundColor: AppTheme.bgSideMenu,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (AppResponsive.isDesktop(context))
              const Expanded(
                child: SideBar(),
              ),

            /// Main Body Part
            Expanded(
              flex: 4,
              child: Container(
                height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: _buildForm,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _buildForm {
    return SingleChildScrollView(
      child: Form(
        key: _formKeyCreateUser,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            newAdminHeader,
            Divider(
              thickness: AppTheme.dividerThickness,
              color: AppTheme.main,
            ),
            Visibility(
              visible: getProperty.isVisible,
              child: const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text('Mandatory fields are marked with (*)'),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      style: const TextStyle(color: AppTheme.defaultTextColor),
                      controller: _nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name cannot be empty';
                        } else if (value.length < 3) {
                          return 'Name must be at least 3 characters long.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Fullname*',
                        hintText: 'e.g John Doe',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      style: const TextStyle(color: AppTheme.defaultTextColor),
                      readOnly: false,
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email cannot be empty';
                        } else if (value.length < 4) {
                          return 'Email must be at least 4 characters long.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email Address*',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      style: const TextStyle(color: AppTheme.defaultTextColor),
                      controller: _usernameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username cannot be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Username*',
                        hintText: 'e.g jdoe',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SwitchListTile(
                    title: const Text(
                      'Status',
                      style: TextStyle(
                        color: AppTheme.defaultTextColor,
                      ),
                    ),
                    subtitle: !getProperty.isActive
                        ? Text(
                            'In Active',
                            style: TextStyle(
                              color: getProperty.isActive
                                  ? AppTheme.main
                                  : AppTheme.red,
                            ),
                          )
                        : Text(
                            'Active',
                            style: TextStyle(
                              color: getProperty.isActive
                                  ? AppTheme.main
                                  : AppTheme.red,
                            ),
                          ),
                    activeColor: AppTheme.main,
                    inactiveThumbColor: AppTheme.defaultTextColor,
                    inactiveTrackColor: AppTheme.grey,
                    value: getProperty.isActive,
                    onChanged: (bool value) {
                      setState(() {
                        getProperty.isActive = value;
                        if (value) {
                          userStatus = 1;
                        } else {
                          userStatus = 0;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: TextFormField(
                      style: const TextStyle(color: AppTheme.defaultTextColor),
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password cannot be empty';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters long.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password*',
                        hintText: 'e.g jD&moh@1',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: getProperty.isInvisible,
              child: Opacity(
                opacity: getProperty.isLoading ? 1.0 : 0,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.main,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      style: const TextStyle(color: AppTheme.defaultTextColor),
                      controller: _line1Controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Address 1 is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Address 1*',
                        hintText: 'e.g postal address,mailing addres',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      style: const TextStyle(color: AppTheme.defaultTextColor),
                      controller: _line2Controller,
                      decoration: InputDecoration(
                        labelText: 'Address 2',
                        hintText: 'e.g it could be name of building etc',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      style: const TextStyle(color: AppTheme.defaultTextColor),
                      controller: _countryController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Country name cannot be empty';
                        } else if (value.length < 3) {
                          return 'Country name must be at least 3 characters long.';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Country*',
                        hintText: 'e.g Kenya',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      onTap: () {
                        setState(() {
                          showCountryPicker(
                            context: context,
                            showPhoneCode: false,
                            exclude: <String>['KP'],
                            onSelect: (Country country) {
                              _countryController.text = country.name;
                            },
                          );
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      style: const TextStyle(color: AppTheme.defaultTextColor),
                      controller: _cityController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'City is required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'City*',
                        hintText: 'e.g Addis Ababa',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: IntlPhoneField(
                      decoration: const InputDecoration(
                        labelText: 'Phone Number*',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                        alignLabelWithHint: true,
                      ),
                      initialCountryCode: 'ET',
                      onChanged: (phone) {
                        setState(() {
                          _dialingController.text = phone.countryCode;
                          _phoneController.text = phone.number;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Visibility(
                    visible: false,
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        style:
                            const TextStyle(color: AppTheme.defaultTextColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      style: const TextStyle(color: AppTheme.defaultTextColor),
                      controller: _stateController,
                      decoration: InputDecoration(
                        labelText: 'State(region)',
                        hintText: 'e.g Addis Ababa',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      style: const TextStyle(color: AppTheme.defaultTextColor),
                      controller: _zipcodeController,
                      decoration: InputDecoration(
                        labelText: 'Zipcode',
                        hintText: 'e.g 00502',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Visibility(
                  visible: getProperty.isInvisible,
                  child: Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        style:
                            const TextStyle(color: AppTheme.defaultTextColor),
                        readOnly: true,
                        controller: _pictureController,
                        decoration: InputDecoration(
                          labelText: 'Profile Picture',
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: InkWell(
                    onTap: () => chooseFile(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.main,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Text(
                        "Upload Picture",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get newAdminHeader {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          if (!AppResponsive.isDesktop(context))
            IconButton(
              tooltip: 'Menu',
              icon: const Icon(
                Icons.menu,
                color: AppTheme.defaultTextColor,
              ),
              onPressed:
                  Provider.of<custom.MenuController>(context, listen: false)
                      .controlMenu,
            ),
          InkWell(
            child: const Icon(
              Icons.arrow_left,
            ),
            onTap: () {
              RouteService.customers(context);
            },
          ),
          InkWell(
            onTap: () {
              RouteService.customers(context);
            },
            child: Text(
              "New Customer",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          if (!AppResponsive.isMobile(context)) ...{
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                      RouteService.customers(context);
                    },
                    child: navigationIcon(
                      icon: Icons.cancel,
                      title: Text(
                        'Cancel',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppTheme.main,
                            ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () => save(context),
                    child: navigationIcon(
                      icon: Icons.save,
                      title: Text(
                        'Save',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppTheme.main,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          }
        ],
      ),
    );
  }

  Widget navigationIcon({icon, title}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
          ),
        ),
        Container(
          child: title,
        )
      ],
    );
  }

  save(ctx) async {
    if (_phoneController.text.isEmpty) {
      snackBarErr(ctx, 'A valid Number is required');
    }
    if (_formKeyCreateUser.currentState!.validate()) {
      setState(() {
        getProperty.isLoading = true;
        getProperty.isInvisible = true;
      });
      await Provider.of<CustomerFactory>(context, listen: false).createCustomer(
        userStatus,
        _nameController.text,
        _emailController.text,
        _usernameController.text,
        _passwordController.text,
        address = Address(
          line1: _line1Controller.text,
          line2: _line2Controller.text,
          city: _cityController.text,
          country: _countryController.text,
          state: _stateController.text,
          zipcode: _zipcodeController.text,
          // formatted_address:
          //     "${_line1Controller.text},${_cityController.text},${_countryController.text},${_stateController.text},${_zipcodeController.text}",
        ),
        phone = Phone(
          code: _dialingController.text,
          number: _phoneController.text,
        ),
        _pictureController.text,
      );
      setState(() {
        getProperty.isLoading = false;
        getProperty.isInvisible = false;
      });

      if (_pictureController.text.isNotEmpty) {
        await uploadFileAvatar();
      }

      snackBarNotification(ctx, ToasterService.successMsg);
      clear();
    } else {
      snackBarError(ctx, _formKeyCreateUser);
    }
  }

  clear() {
    _nameController.clear();
    _emailController.clear();
    _usernameController.clear();
    _passwordController.clear();
    _line1Controller.clear();
    _cityController.clear();
    _countryController.clear();
    _stateController.clear();
    _zipcodeController.clear();
    _pictureController.clear();
    _phoneController.clear();
    imageName = '';
  }

  chooseFile() async {
    var result = await FilePicker.platform.pickFiles(
      // allowMultiple: true,
      // allowedExtensions: ['jpg', 'jpeg', 'png'],
      withReadStream: true,
    );

    if (result != null) {
      setState(() {
        objFile = result.files.single;
        imagePath = objFile!.bytes;
        // var base64 = CryptoUtils.bytesToBase64(imagePath);
        imageName = objFile!.name;
        imageStream = objFile!.readStream;
        imageSize = objFile!.size;
        _pictureController.text = imageName;
        getProperty.isInvisible = true;
        getProperty.uploadVisible = true;
      });
    }
  }

  uploadFileAvatar() async {
    String postUrl = "${ApiEndPoint.endpoint}/users/upload";

    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data; charset=UTF-8',
    };

    var request = http.MultipartRequest("POST", Uri.parse(postUrl));
    request.headers.addAll(headers);

    // add selected file with request
    request.files.add(http.MultipartFile(
      "avatar",
      imageStream,
      imageSize,
      filename: imageName,
    ));

    request.send().then(
      (result) async {
        http.Response.fromStream(result).then((response) {
          return response.body;
        });
      },
    ).catchError((err) => toastError(err));
  }
}
