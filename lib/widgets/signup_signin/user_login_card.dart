// Project Imports
import 'package:onestopservices/widgets/signup_signin/user_login_validate.dart';

// Flutter Imports
import 'package:flutter/material.dart';

class UserSignInCard extends StatefulWidget {
  const UserSignInCard({Key? key}) : super(key: key);

  @override
  UserSignInCardState createState() => UserSignInCardState();
}

class UserSignInCardState extends State<UserSignInCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10,
      child: const BuildFormSignIn(),
    );
  }
}
