// Projects Imports
import 'package:onestopservices/controllers/menu_controller.dart' as custom;
import 'package:onestopservices/screens/witness/create_witness.dart';
import 'package:onestopservices/services/variables_service.dart';
import 'package:onestopservices/themes/app_theme.dart';
import 'package:onestopservices/themes/app_responsive.dart';

// Flutter Iports
import 'package:flutter/material.dart';

// Package Imports
import 'package:provider/provider.dart';

class WitnessHeader extends StatefulWidget {
  const WitnessHeader({super.key});

  @override
  State<WitnessHeader> createState() => _WitnessHeaderState();
}

class _WitnessHeaderState extends State<WitnessHeader> {
  newWitness() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateWitness(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

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
            "Witnesses",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          if (!AppResponsive.isMobile(context)) ...{
            const Spacer(),
            if (getProperty.permissions!
                .where((permission) => permission.module == 'Witnesses')
                .any((p) => p.actions!
                    .any((action) => action.name!.contains('create'))))
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: newWitness,
                      child: navigationIcon(
                        icon: Icons.add,
                        title: Text(
                          'New Witness',
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
