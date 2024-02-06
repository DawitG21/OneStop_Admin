// ignore_for_file: prefer_typing_uninitialized_variables

// Project Imports
import 'package:onestopservices/controllers/route_controller.dart';
import 'package:onestopservices/services/login/login_factory.dart';
import 'package:onestopservices/themes/app_theme.dart';
import 'package:onestopservices/services/main_api_endpoint.dart';

// Flutter Imports
import 'package:flutter/material.dart';
import 'package:onestopservices/widgets/general/custom_expansion.dart';
import 'package:provider/provider.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  SideBarState createState() => SideBarState();
}

class SideBarState extends State<SideBar> {
  final ScrollController _controllerOne = ScrollController();

  @override
  Widget build(BuildContext context) {
    var permissions =
        Provider.of<LoginFactory>(context, listen: false).permission;

    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: 50,
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headlineSmall,
                children: [
                  WidgetSpan(
                    child: Image.asset(
                      ApiEndPoint.appLogo,
                      width: 200.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              thumbVisibility: false,
              controller: _controllerOne,
              child: ListView(
                controller: _controllerOne,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppTheme.defaultTextColor,
                    ),
                    height: MediaQuery.of(context).size.height * 1.6,
                    // height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (permissions!.any(
                            (permission) => permission.module == 'Dashboard'))
                          InkWell(
                            onTap: (() {
                              RouteService.dashboard(context);
                            }),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.home_rounded,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                  Text(
                                    "Dashboard",
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (permissions.any((permission) =>
                            permission.module == 'Admins' ||
                            permission.module == 'Sub Admins'))
                          CustomExpansionTile(
                            tilePadding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            title: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.group_outlined,
                                    color: AppTheme.white,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Administrators",
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            children: <Widget>[
                              if (permissions.any((permission) =>
                                  permission.module == 'Admins'))
                                InkWell(
                                  onTap: () {
                                    RouteService.administrators(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 9.0),
                                          child: Icon(
                                            Icons.arrow_right,
                                            color: AppTheme.white,
                                          ),
                                        ),
                                        Text(
                                          'Admins',
                                          style: TextStyle(
                                            color: AppTheme.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              if (permissions.any((permission) =>
                                  permission.module == 'Sub Admins'))
                                InkWell(
                                  onTap: () {
                                    RouteService.subAdministrators(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 9.0),
                                          child: Icon(
                                            Icons.arrow_right,
                                            color: AppTheme.white,
                                          ),
                                        ),
                                        Text(
                                          'Sub Admins',
                                          style: TextStyle(
                                            color: AppTheme.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                            ],
                          ),
                        if (permissions.any(
                            (permission) => permission.module == 'Customers'))
                          InkWell(
                            onTap: (() {
                              RouteService.customers(context);
                            }),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.people_outlined,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                  Text(
                                    "Customers",
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (permissions
                            .any((permission) => permission.module == 'Agents'))
                          InkWell(
                            onTap: (() {
                              RouteService.agents(context);
                            }),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.people_outlined,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                  Text(
                                    "Agents",
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (permissions.any((permission) =>
                            permission.module == 'Service Providers'))
                          InkWell(
                            onTap: (() {
                              RouteService.taskers(context);
                            }),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.people_outlined,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                  Text(
                                    "Service Providers",
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        // if (permissions.any((permission) =>
                        //     permission.module == 'Providers Wallet' ||
                        //     permission.module == 'Customers Wallet'))
                        //   CustomExpansionTile(
                        //     tilePadding: const EdgeInsets.symmetric(
                        //         horizontal: 18, vertical: 10),
                        //     title: Row(
                        //       children: [
                        //         Padding(
                        //           padding: const EdgeInsets.only(right: 8.0),
                        //           child: Icon(
                        //             Icons.monetization_on,
                        //             color: AppTheme.white,
                        //           ),
                        //         ),
                        //         Expanded(
                        //           child: Text(
                        //             "OneStop Wallet",
                        //             style: TextStyle(
                        //               color: AppTheme.white,
                        //             ),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //     children: <Widget>[
                        //       if (permissions.any((permission) =>
                        //           permission.module == 'Providers Wallet'))
                        //         InkWell(
                        //           onTap: () {
                        //             RouteService.providersBalance(context);
                        //           },
                        //           child: Padding(
                        //             padding: const EdgeInsets.only(
                        //                 left: 50, bottom: 8.0),
                        //             child: Row(
                        //               children: [
                        //                 Container(
                        //                   padding:
                        //                       const EdgeInsets.only(right: 9.0),
                        //                   child: Icon(
                        //                     Icons.arrow_right,
                        //                     color: AppTheme.white,
                        //                   ),
                        //                 ),
                        //                 Text(
                        //                   'Providers Wallet',
                        //                   style: TextStyle(
                        //                     color: AppTheme.white,
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       if (permissions.any((permission) =>
                        //           permission.module == 'Customers Wallet'))
                        //         InkWell(
                        //           onTap: () {
                        //             RouteService.customersBalance(context);
                        //           },
                        //           child: Padding(
                        //             padding: const EdgeInsets.only(
                        //                 left: 50, bottom: 8.0),
                        //             child: Row(
                        //               children: [
                        //                 Container(
                        //                   padding:
                        //                       const EdgeInsets.only(right: 9.0),
                        //                   child: Icon(
                        //                     Icons.arrow_right,
                        //                     color: AppTheme.white,
                        //                   ),
                        //                 ),
                        //                 Text(
                        //                   'Customers Wallet',
                        //                   style: TextStyle(
                        //                     color: AppTheme.white,
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //     ],
                        //   ),

                        if (permissions.any(
                            (permission) => permission.module == 'Bookings'))
                          InkWell(
                            onTap: (() {
                              RouteService.bookings(context);
                            }),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.list_alt_outlined,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                  Text(
                                    "Bookings", // Tasks
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (permissions.any((permission) =>
                            permission.module == 'Transactions'))
                          InkWell(
                            onTap: () {
                              RouteService.transactions(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(right: 9.0),
                                    child: Icon(
                                      Icons.receipt_long_rounded,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                  Text(
                                    'Transactions',
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (permissions.any((permission) =>
                            permission.module == 'Main Categories'))
                          InkWell(
                            onTap: (() {
                              RouteService.maincategories(context);
                            }),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.group_work_rounded,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                  Text(
                                    "Main Categories",
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (permissions.any(
                            (permission) => permission.module == 'Categories'))
                          InkWell(
                            onTap: () {
                              RouteService.categories(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(right: 9.0),
                                    child: Icon(
                                      Icons.library_books_rounded,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                  Text(
                                    'Categories',
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (permissions.any(
                            (permission) => permission.module == 'Services'))
                          InkWell(
                            onTap: () {
                              RouteService.subCategories(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(right: 9.0),
                                    child: Icon(
                                      Icons.library_books_outlined,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                  Text(
                                    'Services', // Sub Categories
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (permissions
                            .any((permission) => permission.module == 'Taxes'))
                          InkWell(
                            onTap: (() {
                              RouteService.taxes(context);
                            }),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.remember_me_rounded,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                  Text(
                                    "Taxes",
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (permissions.any(
                            (permission) => permission.module == 'Discounts'))
                          InkWell(
                            onTap: (() {
                              RouteService.discounts(context);
                            }),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Icon(
                                      Icons.local_offer_rounded,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                  Text(
                                    "Discounts",
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        // InkWell(
                        //   onTap: () {
                        //     RouteService.currencies(context);
                        //   },
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 18, vertical: 10),
                        //     child: Row(
                        //       children: [
                        //         Container(
                        //           padding: const EdgeInsets.only(right: 9.0),
                        //           child: Icon(
                        //             Icons.monetization_on_outlined,
                        //             color: AppTheme.white,
                        //           ),
                        //         ),
                        //         Text(
                        //           'Currencies',
                        //           style: TextStyle(
                        //             color: AppTheme.white,
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        if (permissions.any((permission) =>
                            permission.module == 'Cancellation Rules'))
                          InkWell(
                            onTap: () {
                              RouteService.cancellations(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(right: 9.0),
                                    child: Icon(
                                      Icons.cancel_sharp,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                  Text(
                                    'Cancellation Rules',
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (permissions.any((permission) =>
                            permission.module == 'Payment Gateways'))
                          InkWell(
                            onTap: () {
                              RouteService.paymentgateways(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 10),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(right: 9.0),
                                    child: Icon(
                                      Icons.payment_rounded,
                                      color: AppTheme.white,
                                    ),
                                  ),
                                  Text(
                                    'Payment Gateways',
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (permissions.any((permission) =>
                            permission.module == 'Experiences' ||
                            permission.module == 'Questions' ||
                            permission.module == 'Witnesses'))
                          CustomExpansionTile(
                            tilePadding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            title: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.list_rounded,
                                    color: AppTheme.white,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Provider Management",
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            children: <Widget>[
                              if (permissions.any((permission) =>
                                  permission.module == 'Experiences'))
                                InkWell(
                                  onTap: () {
                                    RouteService.experiences(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 9.0),
                                          child: Icon(
                                            Icons.arrow_right,
                                            color: AppTheme.white,
                                          ),
                                        ),
                                        Text(
                                          'Experiences',
                                          style: TextStyle(
                                            color: AppTheme.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              if (permissions.any((permission) =>
                                  permission.module == 'Questions'))
                                InkWell(
                                  onTap: () {
                                    RouteService.questions(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 9.0),
                                          child: Icon(
                                            Icons.arrow_right,
                                            color: AppTheme.white,
                                          ),
                                        ),
                                        Text(
                                          'Questions',
                                          style: TextStyle(
                                            color: AppTheme.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              if (permissions.any((permission) =>
                                  permission.module == 'Witnesses'))
                                InkWell(
                                  onTap: () {
                                    RouteService.newWitness(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 9.0),
                                          child: Icon(
                                            Icons.arrow_right,
                                            color: AppTheme.white,
                                          ),
                                        ),
                                        Text(
                                          'Witnesses',
                                          style: TextStyle(
                                            color: AppTheme.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                            ],
                          ),
                        if (permissions.any((permission) =>
                            permission.module == 'Agent Transactions' ||
                            permission.module == 'Provider Transactions'))
                          CustomExpansionTile(
                            tilePadding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            title: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.report,
                                    color: AppTheme.white,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Reports",
                                    style: TextStyle(
                                      color: AppTheme.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            children: <Widget>[
                              if (permissions.any((permission) =>
                                  permission.module == 'Agent Transactions'))
                                InkWell(
                                  onTap: () {
                                    RouteService.reportTransactionByAgent(
                                        context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 9.0),
                                          child: Icon(
                                            Icons.arrow_right,
                                            color: AppTheme.white,
                                          ),
                                        ),
                                        Text(
                                          'Agent Transaction',
                                          style: TextStyle(
                                            color: AppTheme.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              if (permissions.any((permission) =>
                                  permission.module == 'Provider Transactions'))
                                InkWell(
                                  onTap: () {
                                    RouteService.reportTransactionByTasker(
                                        context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 40, bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 9.0),
                                          child: Icon(
                                            Icons.arrow_right,
                                            color: AppTheme.white,
                                          ),
                                        ),
                                        Text(
                                          'Provider Transaction',
                                          style: TextStyle(
                                            color: AppTheme.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        const Spacer(),

                        InkWell(
                          onTap: (() {
                            RouteService.signout(context);
                          }),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.exit_to_app_rounded,
                                    color: AppTheme.white,
                                  ),
                                ),
                                Text(
                                  "Sign Out",
                                  style: TextStyle(
                                    color: AppTheme.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
