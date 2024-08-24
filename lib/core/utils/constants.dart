// ignore_for_file: constant_identifier_names

class RouteNames {
  static const SPLASH_SCREEN = '/';

  static const MAIN = '/main';

  static const HOME_INSTALLER = '/home_installer';

  static const ARCHIVE = '/archive';
//personel list
  static const PERSONEL_LIST = '/personel-list';
  static const ADD_PERSONEL = '/add-personel';

//media
  static const ADVERTISING_DETAIL_SCREEN = '/advertising-detail';
  static const MEDIA_INVENTORY_LIST = '/media-inventory-list';
  static const ADD_MEDIA = '/new_add_media';

  //monitoring
  static const MONITORING = '/monitoring';
  static const REQUEST_MONITORING = '/request_monitoring';
  static const ADD_MONITORING = '/add_monitoring';

  //booking
  static const CAMPAIGN = '/campaign';
  static const CAMPAIGN_REQUEST_LIST = '/campaign_request_list';

  //receipt
  static const FACTOR_LIST = '/factor_list';
  static const NewExpenseReceipt = '/NewExpenseReceipt';
  static const NewIncomeReceipt = '/NewIncomeReceipt';
  static const NewPaymentReceipt = '/NewPaymentReceipt';

  //definitions
  static const DEFINITIONS_LIST = '/definitions_list';
  static const NewServices = '/NewServices';
  static const NewBankAccount = '/NewBankAccount';
  static const NewAccountParty = '/NewAccountParty';
  static const NewCashDesk = '/NewCashDesk';

  //contact
  static const CONTRACT_DETAIL = '/contract_detail';
  static const CONTRACT_LIST = '/contract_list';
  static const ADMIN_CONTRACT_DETAIL = '/admin_contract_detail';
  static const ADMIN_CONTRACT_LIST = '/admin_contract_list';
//auth
  static const LOGIN_WITH_OTP_SCREEN = '/LoginCode';
  static const LOGIN_WITH_EMAIL_SCREEN = '/LoginEmail';
  static const PRE_LOGIN_SCREEN = '/LoginMobile';
  static const LOGIN_OPTIONS = '/LoginOptions';
  static const LOGIN_WITH_EMAIL = '/LoginWithEmail';
  static const REGISTER_WITH_EMAIL = '/registerWithEmail';
  static const CONFIRM_EMAIL = '/confirmEmail';
  static const REGISTER = '/register';
  static const REGISTER_BUSINESS = '/registerBusiness';

  static const INTRO = '/intro';

//sample
  static const PRODUCT_LIST = '/SampleList';

//profile
  static const UPDATE_PROFILE = '/update-profile';
  static const SUPPORT = '/support';
  static const ABOUT_US = '/aboutUs';
  static const TERMS_AND_CONDITION = '/termsAndCondition';

  //billing
  static const BILLING = '/Billing';
  static const ACCOUNT_PARTY_BILLING_REPORT = '/ACCOUNT_PARTY_BILLING_REPORT';
  static const ACCOUNT_PARTY_BILLING_REPORT_List =
      '/ACCOUNT_PARTY_BILLING_REPORT_LIST';

  //ongoing operation
  static const ONGOING_OPERATION_LIST = '/ongoing_operation';
  static const ONGOING_OPERATION_REQUEST = '/ongoing_operation_request';
  static const ADD_ONGOING_OPERATION = '/add_ongoing_operation';
  static const ADD_ONGOING_OPERATION_DETAIL = '/add_ongoing_operation_Detail';
}

class URLPath {
  static const BASE_URL = 'https://oneyar.one/app/api/Service/';

  //login
  static const PRE_LOGIN = 'SendOTP';
  static const LOGIN_WITH_OTP = 'Login';

  //home
  static const PROJECTS_NASAB = 'DashboardNasab';

  //upload image
  static const UPLOAD_IMAGE_NASAB = 'UploadImageNasab';
}

class RestApiError {
  static const int FROM_SERVER_ERROR = 500;
  static const int TO_SERVER_ERROR = 599;
  static const int UNAUTHORIZED_ERROR = 599;
}

class SharedPreferencesKeys {
  static const CurrentTheme = "CurrentTheme";
  static const CURRENT_TOKEN = "CurrentToken";
  static const REFRESH_TOKEN = "RefreshToken";
  static const FIRST_OPEN = "FirstOpen";
  static const CURRENT_LANGUAGE = "CurrentLanguage";
  static const FirstDayOfWeek = "FirstDayOfWeek";

  static const IS_SELECTED_LANGUAGE_FOR_FIRST_TIME =
      "IsSelectedLanguageForFirstTime";
}
