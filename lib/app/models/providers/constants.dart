

const String BASE_URL="https://backoffice-dev.biapay.net/api/";

const String LOGIN_URL="auth/login";
const String REGISTER_PRIVATE_URL="user/registered";
const String GENERATE_OTP="api/mfa/generate";
const String OTP_VALIDATE="api/mfa/validate";
const String SECURITY_QUESTIONS="admin/security/questions/public";
const String PRIVATE_USER_REGISTER="user/registration";
const String MERCHENT_USER_REGISTER="merchant/registration";



const String CHANGE_PASSWORD_RECOVER="auth/recovery/confirm";
const String CHANGE_PASSWORD="auth/changePassword";

const String RECOVER_QUESTIONS="auth/recovery";
const String RECOVER_OTP="auth/recovery/otp";
const String QUESTIONS_SEND="auth/recovery/questions";

const String VALID_USER_REGISTERED="user/registered";
  const String TRANSACTION_LIST="user/dashboard/userTransactions";
const String CURRENCY_LIST="admin/currencies";
const String USER_PAY_LINK="user/pay-link";


const String UPLOAD_USER_PRFOFILE="user/profile/image";
const String TICKET_PRFOFILE=BASE_URL+"user/upload/";
const String CUSTOMER_QR_CODE=BASE_URL+"user/qr/";
const String CUSTOMER_BAR_CODE=BASE_URL+"user/barcode/";



const String GET_USER_PRFOFILE=BASE_URL+"user/profile/image";

const String CUSTOMER_PROFILE="user/profile";
const String UPDATE_TICKET="tickets/updateTicket";
const String UPLOAD_TICKET="user/ticket";
const String UPLOAD_TICKET_IMAGE="user/upload";


//merchant all api
const String MERCHENT_ALL_SHOPS="merchant/shops";
const String GET_MERCHRNT_PRFOFILE=BASE_URL+"merchant/profile/image";

const String MERCHENT_QR_CODE=BASE_URL+"merchant/qr/";
const String MERCHENT_BAR_CODE=BASE_URL+"merchant/barcode/";
const String MERCHENT_PROFILE="merchant/profile";
const String UPLOAD_MERCHENT_PRFOFILE="merchant/profile/image";

const String PAYMENT_CATEGORIES_URL="admin/paymentMethods";
const String USER_KYC="user/kyc";
const String MERCHENT_KYC="merchant/kyc";
const String USER_SAVE_KYC="user/kyc";
const String MERCHENT_SAVE_KYC="merchant/kyc";

const String MERCHENT_DASHBOARD_COLLECT_TODAY="merchant/dashboard/get_shop_collect_amount_today/";
const String MERCHENT_DASHBOARD_COLLECT_THIS_WEEK="merchant/dashboard/get_shop_collect_amount_this_week/";
const String MERCHENT_DASHBOARD_COLLECT_SEVEN_DAYS="merchant/dashboard/get_shop_collect_amount_last_7_days/";
const String MERCHENT_DASHBOARD_COLLECT_THIS_MONTH="merchant/dashboard/get_shop_collect_amount_this_month/";
const String MERCHENT_DASHBOARD_COLLECT_LAST_MONTH="merchant/dashboard/get_shop_collect_amount_last_month/";


 const String MERCHENT_DASHBOARD_COLLECT_TODAY_POS="merchant/dashboard/get_pos_collect_amount_today/";
const String MERCHENT_DASHBOARD_COLLECT_THIS_WEEK_POS="merchant/dashboard/get_pos_collect_amount_this_week/";
const String MERCHENT_DASHBOARD_COLLECT_SEVEN_DAYS_POS="merchant/dashboard/get_pos_collect_amount_last_7_days/";
const String MERCHENT_DASHBOARD_COLLECT_THIS_MONTH_POS="merchant/dashboard/get_pos_collect_amount_this_month/";
const String MERCHENT_DASHBOARD_COLLECT_LAST_MONTH_POS="merchant/dashboard/get_pos_collect_amount_last_month/";

const String MERCHENT_DASHBOARD_SUMMARY_API="merchant/dashboard/summary";
const String USER_DASHBOARD_SUMMARY_API="user/dashboard/summary";
const String LAST_LOGIN_API="/user/accessHistory";


const String MERCHENT_COLLECT_TODAY_PAYMENT_METHOD="merchant/dashboard/get_shop_collect_percentage_by_PaymentMethod_today/";
const String MERCHENT_COLLECT_THIS_WEEK__PAYMENT_METHOD="merchant/dashboard/get_shop_collect_percentage_by_PaymentMethod_this_week/";
const String MERCHENT_COLLECT_SEVEN_DAYS__PAYMENT_METHOD="merchant/dashboard/get_shop_collect_percentage_by_PaymentMethod_last_7_days/";
const String MERCHENT_COLLECT_THIS_MONTH__PAYMENT_METHOD="merchant/dashboard/get_shop_collect_percentage_by_PaymentMethod_this_month/";
const String MERCHENT_COLLECT_LAST_MONTH__PAYMENT_METHOD="merchant/dashboard/get_shop_collect_percentage_by_PaymentMethod_last_month/";

const String SUBSCRIPTION_INFORMATION_VIEW="merchant/subscriptions";


const String MERCHENT_COLLECT_TODAY_PAYMENT_CATEGORY="merchant/dashboard/get_shop_collect_percentage_by_PaymentCategory_today/";
const String MERCHENT_COLLECT_THIS_WEEK__PAYMENT_CATEGORY="merchant/dashboard/get_shop_collect_percentage_by_PaymentCategory_this_week/";
const String MERCHENT_COLLECT_SEVEN_DAYS__PAYMENT_CATEGORY="merchant/dashboard/get_shop_collect_percentage_by_PaymentCategory_last_7_days/";
const String MERCHENT_COLLECT_THIS_MONTH__PAYMENT_CATEGORY="merchant/dashboard/get_shop_collect_percentage_by_PaymentCategory_this_month/";
const String MERCHENT_COLLECT_LAST_MONTH__PAYMENT_CATEGORY="merchant/dashboard/get_shop_collect_percentage_by_PaymentCategory_last_month/";



/*----------pie chart for pos when selected shop bases on payment category as well as payment method------------------------*/

const String MERCHENT_COLLECT_TODAY_PAYMENT_CATEGORY_POS="merchant/dashboard/get_pos_collect_percentage_by_PaymentCategory_today/";
const String MERCHENT_COLLECT_THIS_WEEK__PAYMENT_CATEGORY_POS="merchant/dashboard/get_pos_collect_percentage_by_PaymentCategory_this_week/";
const String MERCHENT_COLLECT_SEVEN_DAYS__PAYMENT_CATEGORY_POS="merchant/dashboard/get_pos_collect_percentage_by_PaymentCategory_last_7_days/";
const String MERCHENT_COLLECT_THIS_MONTH__PAYMENT_CATEGORY_POS="merchant/dashboard/get_pos_collect_percentage_by_PaymentCategory_this_month/";
const String MERCHENT_COLLECT_LAST_MONTH__PAYMENT_CATEGORY_POS="merchant/dashboard/get_pos_collect_percentage_by_PaymentCategory_last_month/";



const String MERCHENT_COLLECT_TODAY_PAYMENT_METHOD_POS="merchant/dashboard/get_pos_collect_percentage_by_PaymentMethod_today/";
const String MERCHENT_COLLECT_THIS_WEEK__PAYMENT_METHOD_POS="merchant/dashboard/get_pos_collect_percentage_by_PaymentMethod_this_week/";
const String MERCHENT_COLLECT_SEVEN_DAYS__PAYMENT_METHOD_POS="merchant/dashboard/get_pos_collect_percentage_by_PaymentMethod_last_7_days/";
const String MERCHENT_COLLECT_THIS_MONTH__PAYMENT_METHOD_POS="merchant/dashboard/get_pos_collect_percentage_by_PaymentMethod_this_month/";
const String MERCHENT_COLLECT_LAST_MONTH__PAYMENT_METHOD_POS="merchant/dashboard/get_pos_collect_percentage_by_PaymentMethod_last_month/";


//this same url user for create as well as to get list but methid is different
const String MERCHANT_PAY_LINK="merchant/pay-link";
const String MERCHANT_BULK_PAY_LINK="merchant/pay-link/bulk";




const String CUSTOMER_LIST="customer";
const String PRODUCT_LIST="product";
const String COUPON_LIST="coupon";
const String STATE_LIST="states";
const String CREATE_INVOICE="invoice";
const String SHOPS_LIST="merchant/shops";
const String POS_LIST="merchant/shops/";
const String PRICING_LIST="merchant/subscriptions";
const String PRICING_FEATURED_LIST="admin/subscriptionPlans/featured";





/*------------------links for webview----------------------------------*/
const String TERMS_CONDITIONS="https://www.biapay.net/terms-conditions/";
const String PRIVACY_POLICY="https://www.biapay.net/privacy-policy/";
const String LEGAL_POLICY="https://www.biapay.net/platform-rules/";

