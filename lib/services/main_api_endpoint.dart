class ApiEndPoint {
  // static const serverUrl = '65.109.93.224:4200';
  static const serverUrl = 'localhost:4200';
  static const endpoint = 'http://$serverUrl/api';
  static const prodHost = 'https://onestop.com/category?slug=';
  static const authorisationUrl = 'https://auth.appliedline.com/Account/Login';

  // ASSET FILE
  static const appLogo = 'assets/logo.png';
  static const adminLogo = 'assets/user.png';

  // NETWORK FILES
  static const getCustomerImage = '$endpoint/users/image';
  static const getAgentImage = '$endpoint/agents/image';

  static const getProviderImage = '$endpoint/taskers/image';
  static const getWitnessImage = '$endpoint/witness/file';
  static const getCategoryImage = '$endpoint/newcategories/image';
  static const getMainCategoryImage = '$endpoint/maincategories/image';
}
