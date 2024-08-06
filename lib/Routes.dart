// import 'package:delivery/view/screen/archive.dart';
import 'package:delivery/view/screen/orders/bending.dart';
import 'package:delivery/view/screen/orders/ordersdetails.dart';
import 'package:delivery/view/screen/orders/tracking_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
// import 'package:delivery/Test.dart';
import 'package:delivery/core/Constant/Routes_Const.dart';
import 'package:delivery/core/Middleware/MyMiddleWare.dart';
import 'package:delivery/view/screen/Home_Screen.dart';
import 'package:delivery/view/screen/Language_Screen.dart';
import 'package:delivery/view/screen/OnBoarding_Screen.dart';
import 'package:delivery/view/screen/auth/Login_Screen.dart';
import 'package:delivery/view/screen/auth/forgetpassword/Changepssword_Screen.dart';
import 'package:delivery/view/screen/auth/forgetpassword/ForgetPAsswordSuccess_Screen.dart';
import 'package:delivery/view/screen/auth/forgetpassword/ForgetPasswordEmail_Screen.dart';
import 'package:delivery/view/screen/auth/forgetpassword/ForgetPasswordVerifyCode_Screen.dart';
import 'package:delivery/view/screen/auth/signup/SignUpSuccess_Screen.dart';
import 'package:delivery/view/screen/auth/signup/SignUp_Screen.dart';
import 'package:delivery/view/screen/auth/signup/VerifyCodeSignUp_Screen.dart';

List<GetPage<dynamic>>? getPages = [
  // GetPage(name: "/", page: () => TestScreen()), 
  GetPage(
      name: "/",
      page: () => const LanguageScreen(),
      middlewares: [MyMiddaleWare()]),
  GetPage(name: AppRouts.onBoarding, page: () => const OnBoardingScreen()),
  GetPage(name: AppRouts.logIn, page: () => const LoginScreen()),
  GetPage(name: AppRouts.signUp, page: () => const SignUpScreen()),
  GetPage(
      name: AppRouts.verifyCodeSignUp,
      page: () => const VerifyCodeSignUpScreen()),
  GetPage(
      name: AppRouts.verifyCodeForgetPassword,
      page: () => const VerifyCodeForgetPaswordScreen()),
  GetPage(name: AppRouts.successSignUp, page: () => const SignUpSuccess()),
  GetPage(
      name: AppRouts.forgetPassword,
      page: () => const ForgetPasswordEmailScreen()),
  GetPage(
      name: AppRouts.changePassword, page: () => const ChangePasswordScreen()),
  GetPage(
      name: AppRouts.successChangePassword,
      page: () => const ForgetPasswordSuccessScreen()),
  GetPage(name: AppRouts.home, page: () => const HomeScreen()),
  // GetPage(name: "/", page: () => Test()),
    // GetPage(name: AppRouts.homepage, page: () => const HomeScreen()),
  // GetPage(name: AppRouts.items, page: () => const Items()),
  // GetPage(name: AppRouts.productdetails, page: () => const ProductDetails()),
  // GetPage(name: AppRouts.myFavorite, page: () => const MyFavorite()),
  // GetPage(name: AppRouts.myCart, page: () => const Cart()),
  // GetPage(name: AppRouts.addressview, page: () => const ViewwAddress()),
  // GetPage(name: AppRouts.addressadd, page: () => const AddAddress()),
  // GetPage(name: AppRouts.checkout, page: () => const CheckOut()),
  GetPage(name: AppRouts.tracking, page: () => const TrackingOrders()),
  GetPage(name: AppRouts.orderabinding, page: () => const BendingOrders()),
  GetPage(name: AppRouts.ordersdetails, page: () => const OrdersDetails()),
];
