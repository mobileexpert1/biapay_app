import 'package:biapay_app/app/modules/change_password/bindings/change_password_bindings.dart';
import 'package:biapay_app/app/modules/change_password/views/change_password_view.dart';
import 'package:biapay_app/app/modules/ecommerce/binding/ecommerce_binding.dart';
import 'package:biapay_app/app/modules/ecommerce/view/ecommerce_view.dart';
import 'package:biapay_app/app/modules/ecommerce/z_ecommerce_detail/ecommerce_detail_binding/ecommerce_detail_binding.dart';
import 'package:biapay_app/app/modules/ecommerce/z_ecommerce_detail/ecommerce_detail_view/ecommerce_detail_view.dart';
import 'package:biapay_app/app/modules/forgot_password/bindings/forgot_bindings.dart';
import 'package:biapay_app/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:biapay_app/app/modules/merchent_profile_edit/views/merchent_profile_view.dart';
import 'package:biapay_app/app/modules/request_money/views/show_request_summary.dart';
import 'package:biapay_app/app/modules/request_money/views/show_send_summary.dart';
import 'package:biapay_app/app/modules/transaction/views/transactionn.dart';
import 'package:biapay_app/app/modules/webview/views/webview_view.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../modules/all_plan_information/bindings/all_plan_information_bindings.dart';
import '../modules/all_plan_information/views/all_plan_information_view.dart';
import '../modules/all_shops_information/bindings/all_shop_information_bindings.dart';
import '../modules/all_shops_information/views/all_shop_information_view.dart';
import '../modules/analystics/bindings/analystics_binding.dart';
import '../modules/analystics/views/analystics_view.dart';
import '../modules/background_images/bindings/background_images_binding.dart';
import '../modules/background_images/views/background_images_view.dart';
import '../modules/base_app/bindings/base_app_binding.dart';
import '../modules/base_app/views/base_app_view.dart';
import '../modules/change_password/controllers/change_password_controller.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/choose_language/bindings/choose_language_binding.dart';
import '../modules/choose_language/views/choose_language_view.dart';
import '../modules/claim/bindings/claim_binding.dart';
import '../modules/claim/views/claim_view.dart';
import '../modules/coupon/bindings/coupon_binding.dart';
import '../modules/coupon/views/coupon_view.dart';
import '../modules/customer_qr_barcode/bindings/customer_qr_bindings.dart';
import '../modules/customer_qr_barcode/views/customer_qr_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/bindings/pos_shop_pie_chart_binding.dart';
import '../modules/dashboard/bindings/pos_shop_pie_chart_method_binding.dart';
import '../modules/dashboard/bindings/shop_information_bindings.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dashboard/views/pos_shop_pie_chart_method_view.dart';
import '../modules/dashboard/views/pos_shop_pie_chart_view.dart';
import '../modules/dashboard/views/shop_information_view.dart';
import '../modules/ecommerce/z_ecommerce_cart/ecommerce_cart_binding/ecommerce_cart_binding.dart';
import '../modules/ecommerce/z_ecommerce_cart/ecommerce_cart_view/ecommerce_cart_view.dart';
import '../modules/even_booking/bindings/even_booking_binding.dart';
import '../modules/even_booking/views/even_booking_view.dart';
import '../modules/events/bindings/event_binding.dart';
import '../modules/events/views/event_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/intro/bindings/intro_binding.dart';
import '../modules/intro/views/intro_view.dart';
import '../modules/invoicing/invoicing_list/binding/invoicing_binding.dart';
import '../modules/invoicing/invoicing_list/view/invoicing_view.dart';
import '../modules/invoicing/quotation/binding/quotation_binding.dart';
import '../modules/invoicing/quotation/view/quotation_view.dart';
import '../modules/invoicing/sub_menu_coupons/binding/coupon_binding.dart';
import '../modules/invoicing/sub_menu_coupons/view/coupon_view.dart';
import '../modules/invoicing/sub_menu_coupons/z_add_coupon/binding/add_coupon_binding.dart';
import '../modules/invoicing/sub_menu_coupons/z_add_coupon/view/add_coupon_view.dart';
import '../modules/invoicing/sub_menu_customer/binding/customer_binding.dart';
import '../modules/invoicing/sub_menu_customer/view/customer_view.dart';
import '../modules/invoicing/sub_menu_customer/z_add_customer/binding/add_customer_binding.dart';
import '../modules/invoicing/sub_menu_customer/z_add_customer/view/add_customer_view.dart';
import '../modules/invoicing/sub_menu_invoices/binding/invoices_binding.dart';
import '../modules/invoicing/sub_menu_invoices/views/invoices_view.dart';
import '../modules/invoicing/sub_menu_invoices/z_create_invoice/binding/create_invoice_binding.dart';
import '../modules/invoicing/sub_menu_invoices/z_create_invoice/view/create_invoice_view.dart';
import '../modules/invoicing/sub_menu_product/binding/product_binding.dart';
import '../modules/invoicing/sub_menu_product/view/product_view.dart';
import '../modules/invoicing/sub_menu_product/z_add_product/binding/add_product_binding.dart';
import '../modules/invoicing/sub_menu_product/z_add_product/view/add_product_view.dart';
import '../modules/kyc/bindings/kyc_binding.dart';
import '../modules/kyc/views/kyc_view.dart';
import '../modules/landing/bindings/landing_binding.dart';
import '../modules/landing/views/choose_account_type.dart';
import '../modules/landing/views/landing_view.dart';
import '../modules/merchant_profile_info_dashboard/bindings/merchant_profile_bindings.dart';
 import '../modules/merchant_profile_info_dashboard/views/merchant_profile_dash_view.dart';
import '../modules/merchent_profile_edit/bindings/merchent_profile_binding.dart';
import '../modules/merchent_qr_barcode/bindings/merchent_qr_bindings.dart';
import '../modules/merchent_qr_barcode/views/merchent_qr_view.dart';
import '../modules/my_wallet/bindings/my_wallet_binding.dart';
import '../modules/my_wallet/views/my_wallet_view.dart';
import '../modules/pay_link/bindings/paylink_binding.dart';
import '../modules/pay_link/views/paylink_view.dart';
import '../modules/pin_code/bindings/pin_code_binding.dart';
import '../modules/pin_code/views/pin_code_view.dart';
import '../modules/pricing/pricing_list/binding/pricing_list_binding.dart';
import '../modules/pricing/pricing_list/view/pricing_list_view.dart';
import '../modules/pricing/sub_menu_billing/binding/billing_binding.dart';
import '../modules/pricing/sub_menu_billing/view/billing_view.dart';
import '../modules/profil/bindings/edit_binding.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/edit_profil_view.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/profile_settlement/bindings/add_account_bindings.dart';
import '../modules/profile_settlement/bindings/profile_settlement_bindings.dart';
import '../modules/profile_settlement/views/add_account_view.dart';
import '../modules/profile_settlement/views/profile_settlement_view.dart';
import '../modules/recover_password/bindings/recover_bindings.dart';
import '../modules/recover_password/views/recover_password_view.dart';
import '../modules/request_money/bindings/request_binding.dart';
import '../modules/request_money/views/request_main_view.dart';
import '../modules/request_money/views/request_money.dart';
import '../modules/request_money/views/send_money.dart';
import '../modules/request_money_merchant/bindings/bulk_generate_pay_link_binding.dart';
import '../modules/request_money_merchant/bindings/generate_pay_link_binding.dart';
import '../modules/request_money_merchant/bindings/request_binding_merchant.dart';
import '../modules/request_money_merchant/views/bulk_generate_pay_link.dart';
import '../modules/request_money_merchant/views/generate_pay_link_view.dart';
import '../modules/request_money_merchant/views/request_main_merchant_view.dart';
import '../modules/scan/bindings/scan_binding.dart';
import '../modules/scan/views/scan_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/settlement/settlement_menu_list/binding/settlement_binding.dart';
import '../modules/settlement/settlement_menu_list/view/settlement_view.dart';
import '../modules/settlement/sub_menu_settlement_report/binding/settlement_report_binding.dart';
import '../modules/settlement/sub_menu_settlement_report/view/settlement_report_view.dart';
import '../modules/settlement/sub_menu_settlement_report/z_settlement_detail/binding/settlement_report_detail_binding.dart';
import '../modules/settlement/sub_menu_settlement_report/z_settlement_detail/view/settlement_report_detail_view.dart';
import '../modules/shop_manager/bindings/shop_manager_binding.dart';
import '../modules/shop_manager/views/shop_manager_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/private_registration_binding.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/business_registration/business_registration_one.dart';
import '../modules/signup/private_registration/private_registration_one.dart';
import '../modules/signup/private_registration/private_registration_main.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/subscription_plan/bindings/subscription_plan_binding.dart';
import '../modules/subscription_plan/views/subscription_plan_view.dart';
import '../modules/ticket/bindings/new_ticket_binding.dart';
import '../modules/ticket/bindings/ticket_binding.dart';
import '../modules/ticket/views/new_tiket.dart';
import '../modules/ticket/views/ticket_view.dart';
import '../modules/tontine/bindings/tontine_binding.dart';
import '../modules/tontine/views/tontine_view.dart';
import '../modules/transaction/bindings/transaction_binding.dart';
import '../modules/transaction/views/transaction_view.dart';
import '../modules/transfert/bindings/transfert_binding.dart';
import '../modules/transfert/views/transfert_view.dart';
import '../modules/tutorials/bindings/tutorials_binding.dart';
import '../modules/tutorials/views/tutorials_view.dart';
import '../modules/webview/bindings/webview_bindings.dart';
import '../referal_friends/bindings/referal_bindings.dart';
import '../referal_friends/views/referal_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.BASE_APP,
      page: () => BaseAppView(),
      binding: BaseAppBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_LANGUAGE,
      page: () => ChooseLanguageView(),
      binding: ChooseLanguageBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotBindings(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.MONEY_REQUEST_MAIN,
      page: () => RequestMoneyMainView(),
      binding: RequestBinding(),
    ),
    GetPage(
      name: _Paths.SEND_MONEY,
      page: () => SendMoneyView(),
      binding: RequestBinding(),
    ),
    GetPage(
      name: _Paths.REQUEST_MONEY,
      page: () => RequestMoneyView(),
      binding: RequestBinding(),
    ),
    GetPage(
      name: _Paths.PAY_LINK,
      page: () => PayLinkView(),
      binding: PayLinkBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_SEND_SUMMARY,
      page: () => ShowSendSummaryView(),
      binding: RequestBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_REQUEST_SUMMARY,
      page: () => ShowRequestSummaryView(),
      binding: RequestBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_MANAGEMENT,
      page: () => EventView(),
      binding: EventBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => IntroView(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFERT,
      page: () => TransfertView(),
      binding: TransfertBinding(),
    ),
    GetPage(
      name: _Paths.ANALYSTICS,
      page: () => AnalysticsView(),
      binding: AnalysticsBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => TransactionView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.REFERAL_FRIEND,
      page: () => ReferalView(),
      binding: ReferalBindings(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.COUPON,
      page: () => CouponView(),
      binding: CouponBinding(),
    ),
    GetPage(
      name: _Paths.CLAIM,
      page: () => ClaimView(),
      binding: ClaimBinding(),
    ),
    GetPage(
      name: _Paths.TONTINE,
      page: () => TontineView(),
      binding: TontineBinding(),
    ),
    GetPage(
      name: _Paths.EVEN_BOOKING,
      page: () => EvenBookingView(),
      binding: EvenBookingBinding(),
    ),
    GetPage(
      name: _Paths.WEB_VIEW,
      page: () => WebViewScreen(),
      binding: WevViewBindings(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => LandingView(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_LOGIN_OPTION,
      page: () => ChooseAccountType(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.PIN_CODE,
      page: () => PinCodeView(),
      binding: PinCodeBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.KYC,
      page: () => KycView(),
      binding: KycBinding(),
    ),
    GetPage(
      name: _Paths.TICKET,
      page: () => TicketView(),
      binding: TicketBinding(),
    ),
    GetPage(
      name: _Paths.BACKGROUND_IMAGES,
      page: () => BackgroundImagesView(),
      binding: BackgroundImagesBinding(),
    ),
    GetPage(
      name: _Paths.TUTORIALS,
      page: () => TutorialsView(),
      binding: TutorialsBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION_PLAN,
      page: () => SubscriptionPlanView(),
      binding: SubscriptionPlanBinding(),
    ),
    GetPage(
      name: _Paths.MY_WALLET,
      page: () => MyWalletView(),
      binding: MyWalletBinding(),
    ),
    GetPage(
      name: _Paths.SHOP_MANAGER,
      page: () => ShopManagerView(),
      binding: ShopManagerBinding(),
    ),
    GetPage(
      name: _Paths.PRIVATE_SIGNUP,
      page: () => PrivateRegistrationMain(),
      binding: PrivateRegistrationBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePassword(),
      binding: ChangePasswordBindings(),
    ),
    GetPage(
      name: _Paths.RECOVER_PASSWORD,
      page: () => RecoverPasswordView(),
      binding: RecoverBindings(),
    ),
    GetPage(
      name: _Paths.BUSINESS_SIGNUP,
      page: () => BusinessRegistrationEmailPass(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfil(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.NEW_TICKETS,
      page: () => NewTiket(),
      binding: NewTicketBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_QR_BARCODE,
      page: () => CustomerQrView(),
      binding: CustomerQrBindings(),
    ),
    GetPage(
      name: _Paths.SETTLEMENTREPORT,
      page: () => SettlementReportView(),
      binding: SettlementReportBinding(),
    ),
    GetPage(
      name: _Paths.MERCHENT_QR_BARCODE,
      page: () => MerchentQrView(),
      binding: MerchentQrBindings(),
    ),
    GetPage(
      name: _Paths.SETTLEMENTREPORTDETAIL,
      page: () => SettlementReportDetailView(),
      binding: SettlementReportDetailBinding(),
    ),
    GetPage(
      name: _Paths.MERCHENT_PROFILE_VIEW,
      page: () => MerchentProfileView(),
      binding: MerchentProfileBinding(),
    ),
    GetPage(
      name: _Paths.MERCHENT_PROFILE_SETTLEMENT,
      page: () => ProfileSettlementView(),
      binding: ProfileSettlementBindings(),
    ),


    GetPage(
      name: _Paths.MERCHENT_ADD_SETTLEMENT,
      page: () => AddAccountView(),
      binding: AddAccountBindings(),
    ),
    GetPage(
      name: _Paths.ECOMMERCE,
      page: () => EcommerceView(),
      binding: EcommerceBinding(),
    ),

    GetPage(
      name: _Paths.ECOMMERCEDETAIL,
      page: () => EcommerceDetailView(),
      binding: EcommerceDetailBinding(),
    ),

    GetPage(
      name: _Paths.ECOMMERCECART,
      page: () => EcommerceCartView(),
      binding: EcommerceCartBinding(),
    ),

    GetPage(
      name: _Paths.POS_SHOP_PIE_VIEW,
      page: () => ShopPosPieView(),
      binding: PosShopPieChartBinding(),
    ),


    GetPage(
      name: _Paths.POS_SHOP_PIE_VIEW_METHOD,
      page: () => ShopPosPieMethodView(),
      binding: PosShopPieChartMethodBinding(),
    ),

    GetPage(
      name: _Paths.SHOP_INFORMATION_VIEW,
      page: () => ShopInformationView(),
      binding: ShopInformationBinding(),
    ),

    GetPage(
      name: _Paths.ALL_PLAN_INFORMATION_VIEW,
      page: () => AllPlanInformationView(),
      binding: AllPlanInformationBinding(),
    ),

    GetPage(
      name: _Paths.MERCHENT_PROFILE_DASH_VIEW,
      page: () => MerchantProfileDashView(),
      binding: MerchantProfileDashBinding(),
    ),


    GetPage(
      name: _Paths.REQUEST_MONEY_MERCHANT_VIEW,
      page: () => RequestMoneyMerchantView(),
      binding: RequestMoneyMerchantBinding(),
    ),


    GetPage(
      name: _Paths.REQUEST_MONEY_MERCHANT_VIEW,
      page: () => RequestMoneyMerchantView(),
      binding: RequestMoneyMerchantBinding(),
    ),

    GetPage(
      name: _Paths.GENERATE_PAY_LINK_VIEW,
      page: () => GeneratePayLinkView(),
      binding: GeneratePayLinkBinding(),
    ),




    GetPage(
      name: _Paths.INVOICING,
      page: () => InvoicingView(),
      binding: InvoicingBinding(),
    ),
    GetPage(
      name: _Paths.PRICING,
      page: () => PricingListView(),
      binding: PricingListBinding(),
    ),
    GetPage(
      name: _Paths.BILLING,
      page: () => BillingView(),
      binding: BillingBinding(),
    ),
    GetPage(
      name: _Paths.SETTLEMENT,
      page: () => SettlementView(),
      binding: SettlementBinding(),
    ),
    GetPage(
      name: _Paths.INVOICES,
      page: () => InvoicesView(),
      binding: InvoicesBinding(),
    ),
    GetPage(
      name: _Paths.CREATEINVOICE,
      page: () => CreateInvoiceView(),
      binding: CreateInvoiceBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER,
      page: () => CustomerView(),
      binding: CustomerBinding(),
    ),
    GetPage(
      name: _Paths.ADDCUSTOMER,
      page: () => AddCustomerView(),
      binding: AddCustomerBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.ADDPRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.COUPONS,
      page: () => CouponsView(),
      binding: CouponsBinding(),
    ),
    GetPage(
      name: _Paths.ADDCOUPON,
      page: () => AddCouponView(),
      binding: AddCouponBinding(),
    ),
    GetPage(
      name: _Paths.QUOTATION,
      page: () => QuotationView(),
      binding: QuotationBinding(),
    ),


    GetPage(
      name: _Paths.BULK_GENERATE_PAY_LINK_VIEW,
      page: () => BulkGeneratePayLinkView(),
      binding: BulkGeneratePayLinkBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTIONN,
      page: () => TransactionnView(),
      binding: TransactionnBinding(),
    ),
  ];
}
