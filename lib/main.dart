import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

// Import semua layar
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/explore_screen.dart';

// Import layanan autentikasi
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const BarbershopApp());
}

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        title: 'Barbershop Management',
        theme: ThemeData(
          primarySwatch: Colors.brown, // Tema utama menggunakan warna cokelat
          fontFamily:
              'Poppins', // Gunakan font Poppins untuk tampilan profesional
        ),
        initialRoute: '/login', // Rute awal menuju layar login
        routes: {
          '/login': (context) => const LoginScreen(), // Layar Login
          '/register': (context) => RegisterScreen(), // Layar Register
          '/home': (context) => HomeScreen(), // Layar Utama (Dashboard)
          '/profile': (context) => ProfileScreen(), // Layar Profil Pengguna
          '/contact': (context) => ContactScreen(), // Layar Kontak
          '/explore': (context) =>
              BarbershopExploreScreen(), // Layar Lokasi Barbershop // Layar Tambah/Edit Data
        },
      ),
    );
  }
}
