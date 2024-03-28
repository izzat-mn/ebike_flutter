import 'package:ebike_flutter/bottomNavBar/bottomNavBar.dart';
import 'package:ebike_flutter/views/view.dart';
import 'package:go_router/go_router.dart';

class Routers {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => const BottomNavBar(),
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
        ],
      ),
    ],
  );
}
