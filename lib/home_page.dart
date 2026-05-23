import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controla si el AppBar ya tiene fondo al hacer scroll
  final ScrollController _scrollController = ScrollController();
  bool _showAppBarBg = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final show = _scrollController.offset > 80;
      if (show != _showAppBarBg) setState(() => _showAppBarBg = show);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // ─────────────────────────────────────────────
  // DATOS (sin cambios respecto al original)
  // ─────────────────────────────────────────────

  final Map<String, String> heroData = {
    'titulo': 'Películas y series ilimitadas y mucho más',
    'subtitulo': 'A partir de PEN 28.90. Cancela cuando quieras.',
  };

  final List<Map<String, dynamic>> tendencias = [
    {
      'numero': 1,
      'imagePath': 'assets/images/mi_imagen.jpg',
      'titulo': 'La Casa de Papel',
      'esLocal': true,
    },
    {
      'numero': 2,
      'imagePath': 'https://m.media-amazon.com/images/I/91obuWzA3XL.jpg',
      'titulo': 'Berlín',
      'esLocal': false,
    },
    {
      'numero': 3,
      'imagePath': 'https://cdng.europosters.eu/pod_public/750/262967.jpg',
      'titulo': 'Apex Legends',
      'esLocal': false,
    },
    {
      'numero': 4,
      'imagePath': 'https://www.mubis.es/media/articles/4778/47661/primer-poster-de-la-pelicula-de-marvel-thor-el-mundo-oscuro-original.jpg',
      'titulo': 'Chavin Huantar',
      'esLocal': false,
    },
  ];

  final List<Map<String, dynamic>> motivos = [
    {
      'titulo': 'Disfruta en tu TV',
      'desc': 'Ve en smart TV, PlayStation, Xbox, Chromecast, Apple TV...',
      'icono': Icons.tv_rounded,
    },
    {
      'titulo': 'Descarga tus series',
      'desc': 'Guarda tu contenido favorito y siempre tendrás algo que ver.',
      'icono': Icons.download_rounded,
    },
    {
      'titulo': 'Disfruta donde quieras',
      'desc': 'Películas y series ilimitadas en tu teléfono, tablet, laptop...',
      'icono': Icons.devices_rounded,
    },
    {
      'titulo': 'Crea perfiles para niños',
      'desc': 'Los niños vivirán aventuras con sus personajes favoritos...',
      'icono': Icons.child_care_rounded,
    },
  ];

  final List<Map<String, String>> faqs = [
    {
      'p': '¿Qué es Netflix?',
      'r': 'Netflix es un servicio de streaming que ofrece una gran variedad de películas, series, documentales y mucho más en miles de dispositivos conectados a internet.',
    },
    {
      'p': '¿Cuánto cuesta Netflix?',
      'r': 'Disfruta de Netflix en tu smartphone, tablet, Smart TV, laptop o dispositivo de streaming, todo por una tarifa plana mensual desde PEN 28.90.',
    },
    {
      'p': '¿Dónde puedo ver Netflix?',
      'r': 'Puedes ver Netflix donde quieras, cuando quieras, en una cantidad ilimitada de dispositivos. Inicia sesión en tu cuenta de Netflix para ver contenido al instante.',
    },
  ];

  // ─────────────────────────────────────────────
  // BUILD
  // ─────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      // ── AppBar flotante translúcido (estilo Netflix real) ──
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHero(context),
            const SizedBox(height: 32),
            _buildSectionLabel(context, 'Tendencias'),
            const SizedBox(height: 12),
            _buildTendencias(),
            const SizedBox(height: 36),
            _buildSectionLabel(context, 'Más motivos para unirte'),
            const SizedBox(height: 12),
            _buildMotivos(context),
            const SizedBox(height: 36),
            _buildSectionLabel(context, 'Preguntas frecuentes'),
            const SizedBox(height: 12),
            _buildFaqs(context),
            const SizedBox(height: 36),
            _buildBottomCta(context),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // WIDGETS
  // ─────────────────────────────────────────────

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: _showAppBarBg
            ? const Color(0xFF141414).withOpacity(0.95)
            : Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                // Logo "N" rojo estilo Netflix
                Container(
                  width: 28,
                  height: 40,
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
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    backgroundColor: const Color(0xFFE50914),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      fontFamily: 'RalewayMain',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── HERO ──────────────────────────────────────
  Widget _buildHero(BuildContext context) {
    return Stack(
      children: [
        // Imagen de fondo
        SizedBox(
          height: 520,
          width: double.infinity,
          child: Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: const Color(0xFF1F1F1F)),
          ),
        ),

        // Gradiente superior (para el AppBar)
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 140,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xCC141414), Colors.transparent],
              ),
            ),
          ),
        ),

        // Gradiente inferior (fade al contenido)
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 280,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Color(0xFF141414), Colors.transparent],
              ),
            ),
          ),
        ),

        // Contenido del hero
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  heroData['titulo']!,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 32,
                    shadows: [
                      const Shadow(
                        color: Colors.black87,
                        offset: Offset(0, 2),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  heroData['subtitulo']!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15,
                    color: const Color(0xFFD0D0D0),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pushNamed(context, '/details'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE50914),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      elevation: 4,
                    ),
                    icon: const Icon(Icons.play_arrow_rounded, size: 22),
                    label: const Text(
                      'Completar suscripción',
                      style: TextStyle(
                        fontFamily: 'RalewayMain',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ── LABEL DE SECCIÓN ──────────────────────────
  Widget _buildSectionLabel(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: const Color(0xFFE50914),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  // ── TENDENCIAS ────────────────────────────────
  Widget _buildTendencias() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: tendencias.length,
        itemBuilder: (context, index) {
          final item = tendencias[index];
          return _TendenciaCard(item: item);
        },
      ),
    );
  }

  // ── MOTIVOS ───────────────────────────────────
  Widget _buildMotivos(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: motivos.length,
        itemBuilder: (context, index) {
          final motivo = motivos[index];
          return _MotivoCard(motivo: motivo);
        },
      ),
    );
  }

  // ── FAQS ──────────────────────────────────────
  Widget _buildFaqs(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: faqs.length,
      itemBuilder: (context, index) {
        final item = faqs[index];
        return _FaqTile(pregunta: item['p']!, respuesta: item['r']!);
      },
    );
  }

  // ── CTA FINAL ─────────────────────────────────
  Widget _buildBottomCta(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Línea separadora
          Container(
            height: 1,
            color: const Color(0xFF2A2A2A),
            margin: const EdgeInsets.only(bottom: 28),
          ),
          Text(
            '¿Listo para ver? Ingresa tu correo para crear una cuenta o reiniciar tu membresía.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: const Color(0xFFB3B3B3),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, '/details'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE50914),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              icon: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              label: const Text(
                'Completar suscripción',
                style: TextStyle(
                  fontFamily: 'RalewayMain',
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════
// WIDGETS EXTRAÍDOS
// ═══════════════════════════════════════════════

class _TendenciaCard extends StatefulWidget {
  final Map<String, dynamic> item;
  const _TendenciaCard({required this.item});

  @override
  State<_TendenciaCard> createState() => _TendenciaCardState();
}

class _TendenciaCardState extends State<_TendenciaCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _hovered = true),
      onTapUp: (_) => setState(() => _hovered = false),
      onTapCancel: () => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 130,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        transform: Matrix4.identity()..scale(_hovered ? 1.05 : 1.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Imagen
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: widget.item['esLocal']
                  ? Image.asset(
                      widget.item['imagePath'],
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: const Color(0xFF2A2A2A),
                        child: const Icon(Icons.image_not_supported_rounded,
                            color: Color(0xFF555555), size: 32),
                      ),
                    )
                  : Image.network(
                      widget.item['imagePath'],
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: const Color(0xFF2A2A2A),
                        child: const Icon(Icons.image_not_supported_rounded,
                            color: Color(0xFF555555), size: 32),
                      ),
                    ),
            ),

            // Gradiente inferior para el número
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 80,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xDD000000), Colors.transparent],
                  ),
                ),
              ),
            ),

            // Número grande
            Positioned(
              bottom: 4,
              left: 8,
              child: Text(
                '${widget.item['numero']}',
                style: const TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'CaveatTitles',
                  color: Colors.white,
                  height: 1.0,
                  shadows: [
                    Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 6),
                  ],
                ),
              ),
            ),

            // Badge "TOP" si es el primero
            if (widget.item['numero'] == 1)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE50914),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: const Text(
                    'TOP',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'RalewayMain',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────

class _MotivoCard extends StatelessWidget {
  final Map<String, dynamic> motivo;
  const _MotivoCard({required this.motivo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF2A2A2A), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            motivo['icono'] as IconData,
            color: const Color(0xFFE50914),
            size: 30,
          ),
          const SizedBox(height: 12),
          Text(
            motivo['titulo']!,
            style: const TextStyle(
              fontFamily: 'RalewayMain',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              motivo['desc']!,
              style: const TextStyle(
                fontFamily: 'SmoochSecondary',
                fontSize: 12,
                color: Color(0xFF808080),
                height: 1.5,
              ),
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────

class _FaqTile extends StatefulWidget {
  final String pregunta;
  final String respuesta;
  const _FaqTile({required this.pregunta, required this.respuesta});

  @override
  State<_FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<_FaqTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: ExpansionTile(
          onExpansionChanged: (val) => setState(() => _expanded = val),
          title: Text(
            widget.pregunta,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'RalewayMain',
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: AnimatedRotation(
            turns: _expanded ? 0.125 : 0,
            duration: const Duration(milliseconds: 200),
            child: const Icon(Icons.add, color: Colors.white, size: 22),
          ),
          collapsedBackgroundColor: const Color(0xFF2A2A2A),
          backgroundColor: const Color(0xFF3A3A3A),
          collapsedIconColor: Colors.white,
          iconColor: Colors.white,
          childrenPadding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
          children: [
            Divider(color: Colors.white.withOpacity(0.15), height: 1),
            const SizedBox(height: 14),
            Text(
              widget.respuesta,
              style: const TextStyle(
                fontFamily: 'SmoochSecondary',
                fontSize: 15,
                color: Color(0xFFB3B3B3),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}