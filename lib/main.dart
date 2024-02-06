// Project Imports
import 'package:onestopservices/controllers/menu_controller.dart' as custom;
import 'package:onestopservices/services/agent/agentFactory.dart';
import 'package:onestopservices/services/balance/balanceFactory.dart';
import 'package:onestopservices/services/billing/billingFactory.dart';
import 'package:onestopservices/services/cancellation/cancellationFactory.dart';
import 'package:onestopservices/services/category/categoryFactory.dart';
import 'package:onestopservices/services/categorymain/categoryMainFactory.dart';
import 'package:onestopservices/services/discount/discountFactory.dart';
import 'package:onestopservices/services/currency/currencyFactory.dart';
import 'package:onestopservices/services/experience/experienceFactory.dart';
import 'package:onestopservices/services/paymentgateway/paymentGatewayFactory.dart';
import 'package:onestopservices/services/question/questionFactory.dart';
import 'package:onestopservices/services/report/reportFactory.dart';
import 'package:onestopservices/services/reviews/reviewFactory.dart';
import 'package:onestopservices/services/serviceprovider/providerFactory.dart';
import 'package:onestopservices/services/services/serviceFactory.dart';
import 'package:onestopservices/services/bookings/bookingFactory.dart';
import 'package:onestopservices/services/tax/taxFactory.dart';
import 'package:onestopservices/services/transaction/transactionFactory.dart';
import 'package:onestopservices/services/customer/customerFactory.dart';
import 'package:onestopservices/services/login/login_factory.dart';
import 'package:onestopservices/screens/signup_signin.dart/user_account_signin.dart';
import 'package:onestopservices/services/subadministrator/subadminFactory.dart';
import 'package:onestopservices/services/witness/witnessFactory.dart';
import 'package:onestopservices/themes/app_theme.dart';
import 'package:onestopservices/widgets/signup_signin/oauth.web.service.dart';

// Service Imports
import 'package:onestopservices/services/administrator/adminFactory.dart';

// Flutter Imports
import 'package:flutter/material.dart';

// Package Imports
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => custom.MenuController()),
        ChangeNotifierProvider.value(value: TaxFactory()),
        ChangeNotifierProvider.value(value: LoginFactory()),
        ChangeNotifierProvider.value(value: ReviewFactory()),
        ChangeNotifierProvider.value(value: QuestionFactory()),
        ChangeNotifierProvider.value(value: PaymentFactory()),
        ChangeNotifierProvider.value(value: BillingFactory()),
        ChangeNotifierProvider.value(value: CurrencyFactory()),
        ChangeNotifierProvider.value(value: DiscountFactory()),
        ChangeNotifierProvider.value(value: OAuthWebService()),
        ChangeNotifierProvider.value(value: CustomerFactory()),
        ChangeNotifierProvider.value(value: BalanceFactory()),
        ChangeNotifierProvider.value(value: ExperienceFactory()),
        ChangeNotifierProvider.value(value: CategoryFactory()),
        ChangeNotifierProvider.value(value: CancellationFactory()),
        ChangeNotifierProvider.value(value: AgentFactory()),
        ChangeNotifierProvider.value(value: AdministratorFactory()),
        ChangeNotifierProvider.value(value: MainCategoryFactory()),
        ChangeNotifierProvider.value(value: SubAdministratorFactory()),
        ChangeNotifierProvider.value(value: BookingFactory()),
        ChangeNotifierProvider.value(value: ServiceFactory()),
        ChangeNotifierProvider.value(value: WitnessFactory()),
        ChangeNotifierProvider.value(value: TransactionFactory()),
        ChangeNotifierProvider.value(value: ServiceProviderFactory()),
        ChangeNotifierProvider.value(value: ReportFactory()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ONESTOP SERVICES",
      theme: AppTheme.theming(context),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const UserSignScreen(),
      },
    );
  }
}
