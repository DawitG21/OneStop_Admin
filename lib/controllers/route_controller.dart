// Project Imports

import 'package:onestopservices/screens/agents/create_agent.dart';
import 'package:onestopservices/screens/agents/edit_agent.dart';
import 'package:onestopservices/screens/agents/home.dart';
import 'package:onestopservices/screens/categorymain/create_categorymain.dart';
import 'package:onestopservices/screens/categorymain/edit_categorymain.dart';
import 'package:onestopservices/screens/categorymain/home.dart';
import 'package:onestopservices/screens/customerbalance/edit_customerbalance.dart';
import 'package:onestopservices/screens/customerbalance/home.dart';
import 'package:onestopservices/screens/providerbalance/edit_providerbalance.dart';
import 'package:onestopservices/screens/providerbalance/home.dart';
import 'package:onestopservices/screens/billing/create_billing.dart';
import 'package:onestopservices/screens/billing/edit_billing.dart';
import 'package:onestopservices/screens/billing/home.dart';
import 'package:onestopservices/screens/discount/create_discount.dart';
import 'package:onestopservices/screens/discount/home.dart';
import 'package:onestopservices/screens/booking/home.dart';
import 'package:onestopservices/screens/report/reportTransactionAgent/report_transactionagent.dart';
import 'package:onestopservices/screens/report/reportTransactionTasker/report_transactiontasker.dart';
import 'package:onestopservices/screens/tax/create_tax.dart';
import 'package:onestopservices/screens/tax/home.dart';
import 'package:onestopservices/screens/transaction/home.dart';
import 'package:onestopservices/screens/witness/create_witness.dart';
import 'package:onestopservices/screens/witness/edit_witness.dart';
import 'package:onestopservices/screens/witness/home.dart';
import 'package:onestopservices/utilities/dialog_modal.dart';
import 'package:onestopservices/screens/administrator/create_admin.dart';
import 'package:onestopservices/screens/administrator/edit_admin.dart';
import 'package:onestopservices/screens/administrator/home.dart';
import 'package:onestopservices/screens/cancellationrule/create_cancellation.dart';
import 'package:onestopservices/screens/cancellationrule/edit_cancellation.dart';
import 'package:onestopservices/screens/cancellationrule/home.dart';
import 'package:onestopservices/screens/category/create_category.dart';
import 'package:onestopservices/screens/category/edit_category.dart';
import 'package:onestopservices/screens/category/home.dart';
import 'package:onestopservices/screens/currency/create_currency.dart';
import 'package:onestopservices/screens/currency/edit_currency.dart';
import 'package:onestopservices/screens/currency/home.dart';
import 'package:onestopservices/screens/experience/create_experience.dart';
import 'package:onestopservices/screens/experience/edit_experience.dart';
import 'package:onestopservices/screens/experience/home.dart';
import 'package:onestopservices/screens/paymentgateway/create_paymentgateway.dart';
import 'package:onestopservices/screens/paymentgateway/edit_paymentgateway.dart';
import 'package:onestopservices/screens/paymentgateway/home.dart';
import 'package:onestopservices/screens/question/create_question.dart';
import 'package:onestopservices/screens/question/edit_question.dart';
import 'package:onestopservices/screens/question/home.dart';
import 'package:onestopservices/screens/subadministrator/create_subadmin.dart';
import 'package:onestopservices/screens/subadministrator/edit_subadmin.dart';
import 'package:onestopservices/screens/subadministrator/home.dart';
import 'package:onestopservices/screens/dashboard/home_page.dart';
import 'package:onestopservices/screens/signup_signin.dart/user_account_signin.dart';
import 'package:onestopservices/screens/service/create_service.dart';
import 'package:onestopservices/screens/service/edit_service.dart';
import 'package:onestopservices/screens/service/home.dart';
import 'package:onestopservices/screens/provider/create_provider.dart';
import 'package:onestopservices/screens/provider/edit_provider.dart';
import 'package:onestopservices/screens/provider/home.dart';
import 'package:onestopservices/services/sharedpref_service.dart';

// Flutter Imports
import 'package:flutter/material.dart';
import 'package:onestopservices/screens/customer/create_customer.dart';
import 'package:onestopservices/screens/customer/edit_customer.dart';
import 'package:onestopservices/screens/customer/home.dart';

import '../widgets/administrator/change_password.dart';

SharedPref sharedPref = SharedPref();

class RouteService {
  static dashboard(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const HomePage(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static administrators(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const AdministratorHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newAdmin(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateAdministrator(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updateAdmin(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const EditAdministrator(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static changeAdminPassword(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const PasswordChangePopup(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static subAdministrators(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const SubAdministratorHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newSubAdmin(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateSubAdministrator(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updateSubAdmin(ctx, admin) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => EditSubAdministrator(
          admin: admin,
        ),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static transactions(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const TransactionHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static customers(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CustomerHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newCustomer(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateCustomer(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updateCustomer(ctx, id) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => EditCustomer(
          userId: id,
        ),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static agents(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const AgentHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newAgent(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateAgent(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updateAgent(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const EditAgent(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static taskers(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ProviderHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newTasker(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateTasker(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updateTasker(ctx, id) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => EditProvider(
          userId: id,
        ),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static bookings(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const BookingHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static billings(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const BillingHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newBilling(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateBilling(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updateBilling(ctx, id) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const EditBilling(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static providersBalance(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ProviderBalanceHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static rechargeProviderBalance(ctx, id) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => EditProviderBalance(
          balanceId: id,
        ),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static customersBalance(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CustomerBalanceHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static rechargeCustomerBalance(ctx, id) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => EditCustomerBalance(
          balanceId: id,
        ),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static maincategories(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const MainCategoryHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newMainCategory(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateMainCategory(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updateMainCategory(ctx, id) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => EditMainCategory(
          categoryId: id,
        ),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static categories(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CategoryHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newCategory(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateCategory(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updateCategory(ctx, id) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => EditCategory(
          categoryId: id,
        ),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static subCategories(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ServiceHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newSubCategory(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateService(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updateSubCategory(ctx, sub) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => EditService(
          serviceId: sub,
        ),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static discounts(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const DiscountHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newdiscount(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateDiscount(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static taxes(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const TaxHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newtax(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateTax(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static experiences(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ExperienceHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newExperience(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateExperience(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updateExperience(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const EditExperience(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static questions(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const QuestionHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newQuestion(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateQuestion(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updateQuestion(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const EditQuestion(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static witnesses(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const WitnessHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newWitness(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateWitness(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updateWitness(ctx, witness, provider) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => EditWitness(
          provider: provider,
          witness: witness,
        ),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static cancellations(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CancellationHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newCancellation(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateCancellation(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updateCancellation(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const EditCancellation(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static currencies(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CurrencyHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newCurrency(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreateCurrency(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updateCurreency(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const EditCurrency(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static reportTransactionByAgent(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ReportTransactionAgent(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static reportTransactionByTasker(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ReportTransactionTasker(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static paymentgateways(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const PaymentGatewayHome(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static newPaymentGateway(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const CreatePaymentGateway(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static updatePaymentGateway(ctx) {
    Navigator.pushReplacement(
      ctx,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const EditPaymentGateway(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static routeDashboard(ctx) {
    Navigator.pushReplacement(
      ctx,
      // MaterialPageRoute(
      //   builder: (ctx) => const HomePage(),
      // ),
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const HomePage(),
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }

  static signout(ctx) async {
    final action = await ConfirmationDialog.yesAbortDialog(ctx, 'Confirm',
        'Are you sure you wish to exit the app? Make sure to save all the changes.');
    if (action == DialogAction.yes) {
      await sharedPref.remove('storedToken');
      await sharedPref.remove('storedUserId');
      await sharedPref.remove('storedUserName');
      await sharedPref.remove('storedUserRole');
      await sharedPref.remove('userSignUpDate');
      await sharedPref.remove('storedUserEmail');
      await sharedPref.remove('storedAdmin');
      await sharedPref.remove('storedAccessToken');

      Navigator.pushReplacement(
        ctx,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const UserSignScreen(),
          transitionDuration: const Duration(seconds: 0),
        ),
      );
    } else {
      () => null;
    }
  }
}
