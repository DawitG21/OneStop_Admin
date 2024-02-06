// Project Imports
import 'package:onestopservices/themes/app_theme.dart';

// Flutter Imports
import 'package:flutter/material.dart';
import 'package:onestopservices/widgets/customer/customer_header.dart';
import 'package:onestopservices/widgets/customer/customer_table.dart';

class CustomerIndex extends StatefulWidget {
  const CustomerIndex({super.key});

  @override
  State<CustomerIndex> createState() => _CustomerIndexState();
}

class _CustomerIndexState extends State<CustomerIndex> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.bgWhiteMixin,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListView(
        children: [
          const CustomerHeader(),
          Divider(
            thickness: AppTheme.dividerThickness,
            color: AppTheme.main,
          ),
          const CustomerTable(),
        ],
      ),
    );
  }
}
