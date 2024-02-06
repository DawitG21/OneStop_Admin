// ignore_for_file: prefer_typing_uninitialized_variables
// Project imports:
import 'package:file_picker/file_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:onestopservices/controllers/route_controller.dart';
import 'package:onestopservices/controllers/sidebar_controller.dart';
import 'package:onestopservices/models/phone/phone.dart';
import 'package:onestopservices/services/agent/agentFactory.dart';
import 'package:onestopservices/services/toaster_service.dart';
import 'package:onestopservices/controllers/menu_controller.dart' as custom;
import 'package:onestopservices/services/main_api_endpoint.dart';
import 'package:onestopservices/services/variables_service.dart';
import 'package:onestopservices/themes/app_theme.dart';
import 'package:onestopservices/themes/app_responsive.dart';
import 'package:http/http.dart' as http;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';
// enum Gender { male, female, other }

class CreateAgent extends StatefulWidget {
  const CreateAgent({Key? key}) : super(key: key);

  @override
  CreateAgentState createState() => CreateAgentState();
}

class CreateAgentState extends State<CreateAgent> {
  late GlobalKey<FormState> _formKeyCreateAgent;

  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _genderController = TextEditingController();
  final _dialingController = TextEditingController();
  final _phoneController = TextEditingController();
  final _availabiltyController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _pictureController = TextEditingController();

  int agentStatus = 0;
  VariableService dataservice = VariableService();
  var attachmentName, attachmentSize, attachmentStream;
  var attachmentNameAvatar, attachmentSizeAvatar, attachmentStreamAvatar;
  PlatformFile? objFileAvatar;
  PlatformFile? objFile;

  // SharedPref sharedPref = SharedPref();
  Phone phone = Phone();

  @override
  void initState() {
    super.initState();
    _formKeyCreateAgent = GlobalKey();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _dialingController.dispose();
    _phoneController.dispose();
    _availabiltyController.dispose();
    _descriptionController.dispose();
    _pictureController.dispose();
    super.dispose();
  }

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
                    borderRadius: BorderRadius.circular(20)),
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
        key: _formKeyCreateAgent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            newAgentHeader,
            Divider(
              thickness: AppTheme.dividerThickness,
              color: AppTheme.main,
            ),
            Visibility(
              visible: dataservice.isVisible,
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
                        labelText: 'Full Name*',
                        hintText: 'e.g John Doe',
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
                      readOnly: false,
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Address*',
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
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password cannot be empty';
                        } else if (value.length < 3) {
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
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                        child: Text(
                          dataservice.dropdownGender,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  dataservice.isMaleSelected = true;
                                  dataservice.isFemaleSelected = false;
                                  _genderController.text = "Male";
                                });
                              },
                              icon: const Icon(Icons.male),
                              label: const Text('Male'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: dataservice.isMaleSelected
                                    ? AppTheme.main
                                    : AppTheme.defaultTextColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton.icon(
                              onPressed: () {
                                setState(() {
                                  dataservice.isMaleSelected = false;
                                  dataservice.isFemaleSelected = true;
                                  _genderController.text = "Female";
                                });
                              },
                              icon: const Icon(Icons.female),
                              label: const Text('Female'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: dataservice.isFemaleSelected
                                    ? AppTheme.main
                                    : AppTheme.defaultTextColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                    subtitle: !dataservice.isActive
                        ? Text(
                            'In Active',
                            style: TextStyle(
                              color: dataservice.isActive
                                  ? AppTheme.main
                                  : AppTheme.red,
                            ),
                          )
                        : Text(
                            'Active',
                            style: TextStyle(
                              color: dataservice.isActive
                                  ? AppTheme.main
                                  : AppTheme.red,
                            ),
                          ),
                    activeColor: AppTheme.main,
                    inactiveThumbColor: AppTheme.defaultTextColor,
                    inactiveTrackColor: AppTheme.grey,
                    value: dataservice.isActive,
                    onChanged: (bool value) {
                      setState(() {
                        dataservice.isActive = value;
                        if (value) {
                          agentStatus = 1;
                        } else {
                          agentStatus = 0;
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
                    padding: const EdgeInsets.only(
                        top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
                    child: IntlPhoneField(
                      style: const TextStyle(
                        color: AppTheme.defaultTextColor,
                      ),
                      validator: (PhoneNumber? value) {
                        if (value == null) {
                          return 'Phone number cannot be empty';
                        }
                        return null;
                      },
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
                  child: Container(
                    padding: const EdgeInsets.only(right: 15.0, bottom: 15.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Address cannot be empty';
                        } else if (value.isEmpty) {
                          return 'Address must be field.';
                        }
                        return null;
                      },
                      style: const TextStyle(color: AppTheme.defaultTextColor),
                      keyboardType: TextInputType.text,
                      controller: _availabiltyController,
                      // readOnly: false,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        hintText: 'e.g Jijiga',
                        hintStyle: TextStyle(
                          color: AppTheme.grey,
                        ),
                        suffixIcon: Icon(
                          Icons.pin_drop,
                          color: Theme.of(context).primaryColor,
                        ),
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
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      left: 15.0,
                      right: 15.0,
                      bottom: 15.0,
                    ),
                    child: TextFormField(
                      style: const TextStyle(color: AppTheme.defaultTextColor),
                      keyboardType: TextInputType.text,
                      controller: _pictureController,
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText:
                            'Click the icon on the right to upload picture',
                        hintText: 'Profile Picture',
                        hintStyle: TextStyle(
                          color: AppTheme.grey,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.camera,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {
                            chooseFileAvatar();
                          },
                        ),
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
                      controller: _descriptionController,
                      maxLines: 2,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        hintText: 'e.g Valid while stock last',
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Opacity(
              opacity: dataservice.isLoading ? 1.0 : 0,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppTheme.main,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get newAgentHeader {
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
              RouteService.agents(context);
            },
          ),
          InkWell(
            onTap: () {
              RouteService.agents(context);
            },
            child: Text(
              "New Agent",
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
                      RouteService.agents(context);
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

  chooseFileAvatar() async {
    var result = await FilePicker.platform.pickFiles(
      withReadStream: true,
    );

    if (result != null) {
      setState(() {
        objFileAvatar = result.files.single;
        // attachmentId = objFile!.bytes;
        attachmentNameAvatar = objFileAvatar!.name;
        attachmentStreamAvatar = objFileAvatar!.readStream;
        attachmentSizeAvatar = objFileAvatar!.size;

        // isVisible = true;
        // uploadVisible = true;
      });
      _pictureController.text = attachmentNameAvatar;
      // await uploadFileAvatar();
    }
  }

  uploadFileAvatar() async {
    String postUrl = "${ApiEndPoint.endpoint}/agents/upload";

    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data; charset=UTF-8',
    };

    var request = http.MultipartRequest("POST", Uri.parse(postUrl));
    request.headers.addAll(headers);

    // add selected file with request
    request.files.add(http.MultipartFile(
      "avatar",
      attachmentStreamAvatar,
      attachmentSizeAvatar,
      filename: attachmentNameAvatar,
    ));

    request.send().then(
      (result) async {
        http.Response.fromStream(result).then((response) {
          return response.body;
        });
      },
    ).catchError((err) => toastError(err));
  }

  save(ctx) {
    if (_genderController.text == '') {
      snackBarErr(context, 'Gender is Required');
      return;
    }
    if (_formKeyCreateAgent.currentState!.validate()) {
      setState(() {
        dataservice.isLoading = true;
      });
      if (_pictureController.text != "") {
        uploadFileAvatar();
      }

      Provider.of<AgentFactory>(context, listen: false).createAgent(
        phone = Phone(
          code: _dialingController.text,
          number: _phoneController.text,
        ),
        _usernameController.text,
        _nameController.text,
        _pictureController.text,
        _genderController.text,
        _emailController.text,
        _passwordController.text,
        _availabiltyController.text,
        agentStatus,
        _descriptionController.text,
      );

      setState(() {
        dataservice.isLoading = false;
      });
      snackBarNotification(ctx, ToasterService.successMsg);
      clear();
      // returnHome();
    } else {
      snackBarError(ctx, _formKeyCreateAgent);
    }
  }

  clear() {
    _usernameController.clear();
    _nameController.clear();
    _pictureController.clear();
    _genderController.clear();
    _emailController.clear();
    _passwordController.clear();
    _availabiltyController.clear();
    _descriptionController.clear();
    _dialingController.clear();
    _phoneController.clear();
    attachmentNameAvatar = '';
  }
}
