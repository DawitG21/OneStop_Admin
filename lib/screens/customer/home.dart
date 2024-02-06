// Project Imports
import 'package:onestopservices/controllers/sidebar_controller.dart';
import 'package:onestopservices/controllers/menu_controller.dart' as custom;
import 'package:onestopservices/themes/app_theme.dart';
import 'package:onestopservices/themes/app_responsive.dart';
// Flutter Imports
import 'package:flutter/material.dart';
import 'package:onestopservices/screens/customer/customer.dart';
// Package Imports
import 'package:provider/provider.dart';

class CustomerHome extends StatefulWidget {
  static const routeName = '/customers';

  const CustomerHome({super.key});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
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
            /// Side Navigation Menu
            /// Only show in desktop
            if (AppResponsive.isDesktop(context))
              const Expanded(
                child: SideBar(),
              ),

            /// Main Body Part
            const Expanded(
              flex: 4,
              child: CustomerIndex(),
            ),
          ],
        ),
      ),
    );
  }
}
