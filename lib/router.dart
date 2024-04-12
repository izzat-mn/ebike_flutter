import 'package:ebike_flutter/bottomNavBar/bottomNavBar.dart';
import 'package:ebike_flutter/views/home/add_address_view.dart';
import 'package:ebike_flutter/views/home/check_out_view.dart';
import 'package:ebike_flutter/views/my_bike/history_view.dart';
import 'package:ebike_flutter/views/order/order_view.dart';
import 'package:ebike_flutter/views/view.dart';
import 'package:go_router/go_router.dart';

class Routers {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const BottomNavBar(),
        onExit: (context) {
          return false;
        },
        routes: [
          GoRoute(
            path: 'kyc',
            builder: (context, state) => const KYC(),
          ),
          GoRoute(
            path: 'product',
            builder: (context, state) => const Product(),
          ),
          GoRoute(
            path: 'product_detail',
            builder: (context, state) => const ProductDetail(),
          ),
          GoRoute(
            path: 'kyc_verification',
            builder: (context, state) => const KycVerification(),
          ),
          GoRoute(
            path: 'privacy_policy',
            builder: (context, state) => const PrivacyPolicy(),
          ),
          GoRoute(
            path: 'product_approval',
            builder: (context, state) => const ProductApproval(),
          ),
          GoRoute(
            path: 'history',
            builder: (context, state) => const HistoryView(),
          ),
          GoRoute(
            path: 'check_out',
            builder: (context, state) => const CheckoutView(),
          ),
          GoRoute(
            path: 'add_address',
            builder: (context, state) => const AddAddressView(),
          ),
        ],
      ),
    ],
  );
}
