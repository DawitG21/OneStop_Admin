// Project imports:

import 'package:fluttertoast/fluttertoast.dart';
import 'package:onestopservices/services/login/login_factory.dart';
import 'package:onestopservices/controllers/route_controller.dart';
import 'package:onestopservices/models/signin/signin.dart';
import 'package:onestopservices/services/variables_service.dart';
import 'package:onestopservices/services/sharedpref_service.dart';
import 'package:onestopservices/themes/app_theme.dart';
import 'package:onestopservices/widgets/general/fade_animation.dart';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Package Imports

class AuthorisationModal extends StatefulWidget {
  const AuthorisationModal({super.key});

  @override
  State<AuthorisationModal> createState() => _AuthorisationModalState();
}

class _AuthorisationModalState extends State<AuthorisationModal> {
  SignIn userObject = SignIn();
  SharedPref sharedPref = SharedPref();
  VariableService getProperty = VariableService();

  GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorResponse;
  dynamic ctx;

  @override
  void initState() {
    super.initState();
    _formKeyLogin = GlobalKey();
    usernameController.text = 'admin@etonestop.com';
    passwordController.text = 'crT@89';
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: AppTheme.sizeBoxHeight,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -40,
                  height: AppTheme.sizeBoxHeight,
                  width: width,
                  child: FadeAnimation(
                    1,
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/background-6.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  height: AppTheme.sizeBoxHeight,
                  width: width + 20,
                  child: FadeAnimation(
                    1.3,
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/background-5.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // FadeAnimation(
                //   1.5,
                //   Text(
                //     "Sign In Authorization",
                //     style: Theme.of(context).textTheme.titleSmall?.copyWith(
                //           color: AppTheme.defaultTextColor,
                //         ),
                //   ),
                // ),
                const SizedBox(
                  height: AppTheme.sizeBoxSpace,
                ),
                FadeAnimation(
                    1.7,
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(196, 135, 198, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            )
                          ]),
                      child: Form(
                        key: _formKeyLogin,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: AppTheme.grey),
                                ),
                              ),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: AppTheme.defaultTextColor),
                                keyboardType: TextInputType.emailAddress,
                                controller: usernameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Username cannot be empty';
                                  } else if (value.length < 3) {
                                    return 'Username must be at least 3 characters long.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                    color: AppTheme.grey,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: AppTheme.defaultTextColor),
                                keyboardType: TextInputType.text,
                                controller: passwordController,
                                obscureText: !getProperty.passwordVisible,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password cannot be empty';
                                  } else if (value.length < 3) {
                                    return 'Password must be at least 3 characters long.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: AppTheme.grey,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      getProperty.passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        getProperty.passwordVisible =
                                            !getProperty.passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(
                  height: AppTheme.sizeBoxSpace2,
                ),
                Opacity(
                  opacity: getProperty.isLoading ? 1.0 : 0,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.main,
                    ),
                  ),
                ),
                FadeAnimation(
                  1.9,
                  InkWell(
                    onTap: () => {
                      authenticateWebHack(context),
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppTheme.main,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: AppTheme.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> authenticateWebHack(ctx) async {
    if (_formKeyLogin.currentState!.validate()) {
      setState(() {
        getProperty.isLoading = true;
      });
      userObject = SignIn(
        email: usernameController.text,
        password: passwordController.text,
      );

      var res = await Provider.of<LoginFactory>(context, listen: false)
          .signIn(usernameController.text, passwordController.text);

      if (res != null) {
        if (res.status == 1) {
          showCustomError('Welcome , ${res.name}');

          RouteService.routeDashboard(ctx);
        } else {
          showCustomError('Incorrect email or password');
        }
      } else {
        showCustomError('Oops, Something went wrong Try Again.');
      }
      setState(() {
        getProperty.isLoading = false;
      });
    }
  }
}

void showCustomError(String errorMessage) {
  Fluttertoast.showToast(
    webPosition: 'right',
    msg: errorMessage,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 3,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
