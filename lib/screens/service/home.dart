// Project Imports
import 'package:onestopservices/controllers/sidebar_controller.dart';
import 'package:onestopservices/controllers/menu_controller.dart' as custom;
import 'package:onestopservices/themes/app_theme.dart';
import 'package:onestopservices/themes/app_responsive.dart';

// Flutter Imports
import 'package:flutter/material.dart';
import 'package:onestopservices/screens/service/service.dart';
// Package Imports
import 'package:provider/provider.dart';

class ServiceHome extends StatefulWidget {
  static const routeName = '/services';

  const ServiceHome({super.key});

  @override
  State<ServiceHome> createState() => _ServiceHomeState();
}

class _ServiceHomeState extends State<ServiceHome> {
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
              child: ServiceIndex(),
            ),
          ],
        ),
      ),
    );
  }
}
