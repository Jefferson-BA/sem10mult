import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // --- DATOS USANDO LISTAS Y MAPAS ---

    // 1. Datos del Héroe
    final Map<String, String> heroData = {
      'titulo': 'Películas y series ilimitadas y mucho más',
      'subtitulo': 'A partir de PEN 28.90. Cancela cuando quieras.',
    };

    // 2. Datos de Tendencias (ListView Horizontal, Cartas, Imágenes)
    final List<Map<String, dynamic>> tendencias = [
      {
        'numero': 1,
        'imagePath': 'assets/images/mi_imagen.jpg', // <--- IMAGEN LOCAL
        'titulo': 'La Casa de Papel',
        'esLocal': true,
      },
      {
        'numero': 2,
        'imagePath': 'https://m.media-amazon.com/images/I/91obuWzA3XL.jpg', // <--- IMAGEN NUBE 1
        'titulo': 'Berlín',
        'esLocal': false,
      },
      {
        'numero': 3,
        'imagePath': 'https://cdng.europosters.eu/pod_public/750/262967.jpg', // <--- IMAGEN NUBE 2
        'titulo': 'Apex Legends',
        'esLocal': false,
      },
      {
        'numero': 4,
        'imagePath': 'https://www.mubis.es/media/articles/4778/47661/primer-poster-de-la-pelicula-de-marvel-thor-el-mundo-oscuro-original.jpg', // <--- IMAGEN NUBE 3 (Ejemplo)
        'titulo': 'Chavin Huantar',
        'esLocal': false,
      },
    ];

    // 3. Datos de "Más motivos" (Cards con Iconos de red)
    final List<Map<String, String>> motivos = [
      {'titulo': 'Disfruta en tu TV', 'desc': 'Ve en smart TV, PlayStation, Xbox, Chromecast, Apple TV...'},
      {'titulo': 'Descarga tus series', 'desc': 'Guarda tu contenido favorito y siempre tendrás algo que ver.'},
      {'titulo': 'Disfruta donde quieras', 'desc': 'Películas y series ilimitadas en tu teléfono, tablet, laptop...'},
      {'titulo': 'Crea perfiles para niños', 'desc': 'Los niños vivirán aventuras con sus personajes favoritos...'}
    ];

    // 4. Datos de FAQ (ListView con ExpansionTiles)
    final List<Map<String, String>> faqs = [
      {'p': '¿Qué es Netflix?', 'r': 'Netflix es un servicio de streaming que ofrece una gran variedad de películas...'},
      {'p': '¿Cuánto cuesta Netflix?', 'r': 'Disfruta de Netflix en tu smartphone, tablet, Smart TV, laptop o dispositivo de streaming...'},
      {'p': '¿Dónde puedo ver Netflix?', 'r': 'Puedes ver Netflix donde quieras, cuando quieras, en una cantidad ilimitada...'},
    ];

    return Scaffold(
      body: SingleChildScrollView( // Usamos SingleChildScrollView para todo el scroll
        child: Column(
          children: [
            // --- SECCIÓN HÉROE (CABECERA) ---
            Stack(
              alignment: Alignment.center,
              children: [
                // Imagen de fondo (puedes buscar una de red si quieres)
                const Image(
                  image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  height: 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Superposición oscura
                Container(height: 400, width: double.infinity, color: Colors.black.withOpacity(0.6)),
                // Contenido del texto y botón
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(heroData['titulo']!, style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center), // Tipo 2
                      const SizedBox(height: 10),
                      Text(heroData['subtitulo']!, style: const TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'RalewayMain'), textAlign: TextAlign.center), // Tipo 1
                      const SizedBox(height: 20),
                      // --- BOTÓN RED (DEMOSTRACIÓN DE RUTA) ---
                      ElevatedButton.icon(
                        onPressed: () => Navigator.pushNamed(context, '/details'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                        icon: const Icon(Icons.arrow_forward_ios, size: 16),
                        label: const Text('Completar suscripción'),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // --- SECCIÓN TENDENCIAS (ListView Horizontal + Cards + Números) ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(alignment: Alignment.centerLeft, child: Text('Tendencias', style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 24))), // Tipo 2
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: tendencias.length,
                itemBuilder: (context, index) {
                  final item = tendencias[index];
                  return Container(
                    width: 130,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      children: [
                        // --- TARJETA CON IMAGEN (LOCAL O NUBE) ---
                        Card(
                          elevation: 5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: item['esLocal']
                                ? Image.asset(item['imagePath'], fit: BoxFit.cover, height: double.infinity, width: double.infinity)
                                : Image.network(item['imagePath'], fit: BoxFit.cover, height: double.infinity, width: double.infinity),
                          ),
                        ),
                        // --- NÚMERO SUPERPUESTO ---
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Text('${item['numero']}', style: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, decoration: TextDecoration.underline, fontFamily: 'RalewayMain')), // Tipo 1 prominent
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // --- SECCIÓN MÁS MOTIVOS (Cards + Textos Secundarios) ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(alignment: Alignment.centerLeft, child: Text('Más motivos para unirte', style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 24))), // Tipo 2
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: motivos.map((motivo) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      width: 180,
                      height: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(motivo['titulo']!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'RalewayMain')), // Tipo 1 bold
                          const SizedBox(height: 10),
                          Text(motivo['desc']!, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis, maxLines: 4), // Tipo 3
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            // --- SECCIÓN PREGUNTAS FRECUENTES (ListView de ExpansionTiles) ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(alignment: Alignment.centerLeft, child: Text('Preguntas frecuentes', style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 24))), // Tipo 2
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                final item = faqs[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: ExpansionTile( // <--- DEMOSTRACIÓN DE UN TILE AVANZADO (como ListTile pero expandible)
                      title: Text(item['p']!, style: const TextStyle(color: Colors.white, fontFamily: 'RalewayMain', fontSize: 18)), // Tipo 1
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.grey,
                      collapsedBackgroundColor: const Color(0xFF1F1F1F),
                      backgroundColor: const Color(0xFF1F1F1F),
                      trailing: const Icon(Icons.add),
                      childrenPadding: const EdgeInsets.all(15),
                      children: [
                        Text(item['r']!, style: Theme.of(context).textTheme.bodySmall), // Tipo 3
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),
            // --- BOTÓN RED FINAL ---
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/details'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white, minimumSize: const Size(double.infinity, 50)),
                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                label: const Text('Completar suscripción'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}