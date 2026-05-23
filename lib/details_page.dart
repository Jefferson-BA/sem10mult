import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        backgroundColor: const Color(0xFF141414),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              width: 22,
              height: 32,
              decoration: const BoxDecoration(
                color: Color(0xFFE50914),
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
              alignment: Alignment.center,
              child: const Text(
                'N',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'CaveatTitles',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Completar Registro',
              style: TextStyle(
                fontFamily: 'RalewayMain',
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Indicador de pasos ──────────────────
            _buildStepIndicator(),

            const SizedBox(height: 36),

            // ── Título y descripción ────────────────
            Text(
              'Elige tu plan',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 28),
            ),
            const SizedBox(height: 8),
            Text(
              'Esta página simula el siguiente paso del registro.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 32),

            // ── Cards de planes ─────────────────────
            _buildPlanCard(
              context,
              nombre: 'Estándar con anuncios',
              precio: 'PEN 28.90',
              detalle: '1080p · 2 pantallas simultáneas',
              destacado: false,
            ),
            const SizedBox(height: 12),
            _buildPlanCard(
              context,
              nombre: 'Estándar',
              precio: 'PEN 45.90',
              detalle: '1080p · 2 pantallas simultáneas',
              destacado: false,
            ),
            const SizedBox(height: 12),
            _buildPlanCard(
              context,
              nombre: 'Premium',
              precio: 'PEN 59.90',
              detalle: '4K + HDR · 4 pantallas simultáneas',
              destacado: true,
            ),

            const SizedBox(height: 36),

            // ── Características incluidas ───────────
            _buildFeaturesSection(context),

            const SizedBox(height: 36),

            // ── CTA ─────────────────────────────────
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE50914),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'Siguiente',
                  style: TextStyle(
                    fontFamily: 'RalewayMain',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Volver',
                  style: TextStyle(
                    fontFamily: 'RalewayMain',
                    color: Color(0xFFB3B3B3),
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFB3B3B3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // INDICADOR DE PASOS (estilo Netflix real)
  // ─────────────────────────────────────────────
  Widget _buildStepIndicator() {
    return Row(
      children: List.generate(3, (i) {
        final isActive = i == 1; // paso 2 activo
        final isDone = i == 0;
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: i < 2 ? 6 : 0),
            height: 4,
            decoration: BoxDecoration(
              color: isDone
                  ? const Color(0xFFE50914)
                  : isActive
                      ? const Color(0xFFE50914)
                      : const Color(0xFF3A3A3A),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }

  // ─────────────────────────────────────────────
  // PLAN CARD
  // ─────────────────────────────────────────────
  Widget _buildPlanCard(
    BuildContext context, {
    required String nombre,
    required String precio,
    required String detalle,
    required bool destacado,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: destacado ? const Color(0xFF1A0000) : const Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: destacado ? const Color(0xFFE50914) : const Color(0xFF2A2A2A),
          width: destacado ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          // Círculo selector
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: destacado ? const Color(0xFFE50914) : Colors.transparent,
              border: Border.all(
                color: destacado ? const Color(0xFFE50914) : const Color(0xFF555555),
                width: 2,
              ),
            ),
            child: destacado
                ? const Icon(Icons.check, color: Colors.white, size: 14)
                : null,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: TextStyle(
                    fontFamily: 'RalewayMain',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: destacado ? Colors.white : const Color(0xFFB3B3B3),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  detalle,
                  style: const TextStyle(
                    fontFamily: 'SmoochSecondary',
                    fontSize: 12,
                    color: Color(0xFF808080),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                precio,
                style: const TextStyle(
                  fontFamily: 'RalewayMain',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'al mes',
                style: TextStyle(
                  fontFamily: 'SmoochSecondary',
                  fontSize: 11,
                  color: Color(0xFF808080),
                ),
              ),
            ],
          ),
          if (destacado) ...[
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFE50914),
                borderRadius: BorderRadius.circular(3),
              ),
              child: const Text(
                'MEJOR',
                style: TextStyle(
                  fontFamily: 'RalewayMain',
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // SECCIÓN DE CARACTERÍSTICAS
  // ─────────────────────────────────────────────
  Widget _buildFeaturesSection(BuildContext context) {
    final features = [
      {'icon': Icons.hd_rounded, 'text': 'Video en 4K + HDR disponible'},
      {'icon': Icons.download_done_rounded, 'text': 'Descarga en dispositivos compatibles'},
      {'icon': Icons.devices_rounded, 'text': 'Ve en cualquier dispositivo'},
      {'icon': Icons.cancel_outlined, 'text': 'Cancela en cualquier momento'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Todo incluido',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        ...features.map(
          (f) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              children: [
                Icon(
                  f['icon'] as IconData,
                  color: const Color(0xFFE50914),
                  size: 22,
                ),
                const SizedBox(width: 12),
                Text(
                  f['text'] as String,
                  style: const TextStyle(
                    fontFamily: 'RalewayMain',
                    fontSize: 14,
                    color: Color(0xFFB3B3B3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}