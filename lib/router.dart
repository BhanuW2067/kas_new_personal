import 'package:app_3/screens/kas_keluar_screen.dart';
import 'package:app_3/screens/transaksi_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:app_3/screens/home_screen.dart';
import 'package:app_3/screens/kas_masuk_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'root',
    builder: (context, state) => const HomeScreen(),
    routes: [
      GoRoute(
        path: 'kas_masuk',
        name: 'kas_masuk',
        builder: (context, state) => const KasMasukScreen(),
      ),
      GoRoute(
        path: 'kas_keluar',
        name: 'kas_keluar',
        builder: (context, state) => const KasKeluarScreen(),
      ),
      GoRoute(
        name: 'transaksi',
        path: 'transaksi',
        builder: (context, state) => const TransaksiScreen(),
      ),
    ],
  ),
]);
