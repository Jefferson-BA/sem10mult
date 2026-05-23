import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';
import 'details_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MiLaboratorioNetflix());
}

class MiLaboratorioNetflix extends StatelessWidget {
  const MiLaboratorioNetflix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix UI Laboratorio',

      // --- TEMA GLOBAL OSCURO DE NETFLIX ---
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFF141414),
        cardColor: const Color(0xFF1F1F1F),
        dialogBackgroundColor: const Color(0xFF1F1F1F),

        // --- COLORES NETFLIX ---
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFE50914),       // Rojo Netflix puro
          secondary: Color(0xFFE50914),
          surface: Color(0xFF1F1F1F),
          background: Color(0xFF141414),
          onPrimary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
        ),

        // --- APPBAR TRANSPARENTE ESTILO NETFLIX ---
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            fontFamily: 'CaveatTitles',
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),

        // --- ELEVATED BUTTON ESTILO NETFLIX ---
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE50914),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            textStyle: const TextStyle(
              fontFamily: 'RalewayMain',
              fontSize: 15,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),

        // --- DIVIDER SUTIL ---
        dividerColor: const Color(0xFF2A2A2A),

        // --- 3 TIPOS DE LETRA EN EL TEMA ---
        fontFamily: 'RalewayMain',
        textTheme: const TextTheme(
          // Tipo 2 — Títulos grandes con CaveatTitles
          displayLarge: TextStyle(
            fontFamily: 'CaveatTitles',
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
          // Título de secciones
          titleLarge: TextStyle(
            fontFamily: 'CaveatTitles',
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
          // Tipo 1 — Cuerpo principal RalewayMain
          bodyLarge: TextStyle(
            fontFamily: 'RalewayMain',
            fontSize: 16,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'RalewayMain',
            fontSize: 14,
            color: Color(0xFFB3B3B3),
          ),
          // Tipo 3 — Secundaria SmoochSecondary
          bodySmall: TextStyle(
            fontFamily: 'SmoochSecondary',
            fontSize: 13,
            color: Color(0xFF808080),
            height: 1.5,
          ),
          labelLarge: TextStyle(
            fontFamily: 'RalewayMain',
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/details': (context) => const DetailsPage(),
      },
    );
  }
}