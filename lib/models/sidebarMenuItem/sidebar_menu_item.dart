class Item {
  String headerText;
  bool isExpanded;
  bool isOpen;

  Item({
    required this.headerText,
    this.isExpanded = true,
    this.isOpen = false,
  });
}

class Role {
  String create;
  String access;
  String delete;

  Role({
    required this.create,
    required this.access,
    required this.delete,
  });
}

List<Item> sidebarMenuItems = [
  Item(
    headerText: 'Dashboard',
  ),
  Item(
    headerText: 'Admins',
  ),
  Item(
    headerText: 'Sub Admins',
  ),
  Item(
    headerText: 'Customers',
  ),
  Item(
    headerText: 'Agents',
  ),
  Item(
    headerText: 'Service Providers',
  ),
  Item(
    headerText: 'Providers Wallet',
  ),
  Item(
    headerText: 'Customers Wallet',
  ),
  Item(
    headerText: 'Bookings',
  ),
  Item(
    headerText: 'Transactions',
  ),
  Item(
    headerText: 'Main Categories',
  ),
  Item(
    headerText: 'Categories',
  ),
  Item(
    headerText: 'Services',
  ),
  Item(
    headerText: 'Taxes',
  ),
  Item(
    headerText: 'Discounts',
  ),
  Item(
    headerText: 'Cancellation Rules',
  ),
  Item(
    headerText: 'Payment Gateways',
  ),
  Item(
    headerText: 'Experiences',
  ),
  Item(
    headerText: 'Questions',
  ),
  Item(
    headerText: 'Witnesses',
  ),
  Item(
    headerText: 'Agent Transaction',
  ),
  Item(
    headerText: 'Provider Transaction',
  ),
];

List<Role> roles = [
  Role(
    create: 'create',
    access: 'access',
    delete: 'delete',
  ),
];
