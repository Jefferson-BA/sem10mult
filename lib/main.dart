import 'package:flutter/material.dart';
import 'home_page.dart';
import 'details_page.dart'; // Importa la nueva página de detalles

void main() => runApp(const MiLaboratorioNetflix());

class MiLaboratorioNetflix extends StatelessWidget {
  const MiLaboratorioNetflix({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix UI Laboratorio',
      
      // --- TEMA GLOBAL OSCURO DE NETFLIX ---
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.black, // Fondo negro completo
        cardColor: const Color(0xFF1F1F1F), // Un gris muy oscuro para las tarjetas
        dialogBackgroundColor: const Color(0xFF1F1F1F), // Para ExpansionTile
        
        // --- 3 TIPOS DE LETRA EN EL TEMA ---
        fontFamily: 'RalewayMain', // Tipo de letra 1 (Principal por defecto)
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'CaveatTitles', fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold), // Tipo 2 (Titulos)
          bodyMedium: TextStyle(fontFamily: 'RalewayMain', fontSize: 16, color: Colors.grey),
          bodySmall: TextStyle(fontFamily: 'SmoochSecondary', fontSize: 14, color: Colors.grey), // Tipo 3 (Secundaria)
        ),
      ),

      // --- RUTAS DE NAVEGACIÓN ---
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/details': (context) => const DetailsPage(), // Página de ejemplo para la ruta
      },
    );
  }
}