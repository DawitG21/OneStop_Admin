// Projects Imports
import 'package:onestopservices/controllers/menu_controller.dart' as custom;
import 'package:onestopservices/controllers/route_controller.dart';
import 'package:onestopservices/services/variables_service.dart';
import 'package:onestopservices/themes/app_theme.dart';
import 'package:onestopservices/themes/app_responsive.dart';

// Flutter Iports
import 'package:flutter/material.dart';

// Package Imports
import 'package:provider/provider.dart';

class ServiceHeader extends StatefulWidget {
  const ServiceHeader({super.key});

  @override
  State<ServiceHeader> createState() => _ServiceHeaderState();
}

class _ServiceHeaderState extends State<ServiceHeader> {
  VariableService getProperty = VariableService();

  @override
  void initState() {
    getProperty.getPermissions(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          Text(
            "Services", // Sub-Category
            style: Theme.of(context).textTheme.titleSmall,
          ),
          if (!AppResponsive.isMobile(context)) ...{
            const Spacer(),
            if (getProperty.permissions!
                .where((permission) => permission.module == 'Services')
                .any((p) => p.actions!
                    .any((action) => action.name!.contains('create'))))
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        RouteService.newSubCategory(context);
                      },
                      child: navigationIcon(
                        icon: Icons.add,
                        title: Text(
                          'New Service',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
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
}
