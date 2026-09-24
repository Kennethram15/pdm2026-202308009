import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const Color colorFondo = Color(0xFFF4F6F8);
const Color colorOscuro = Color(0xFF263238);
const Color colorVerde = Color(0xFF2E7D32);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marcador Deportivo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: colorFondo,
        appBarTheme: const AppBarTheme(
          backgroundColor: colorOscuro,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const MarcadorPage(),
    );
  }
}

class MarcadorPage extends StatefulWidget {
  const MarcadorPage({super.key});

  @override
  State<MarcadorPage> createState() => _MarcadorPageState();
}

class _MarcadorPageState extends State<MarcadorPage> {
  int puntosA = 0;
  int puntosB = 0;

  String obtenerResultado() {
    if (puntosA > puntosB) {
      return 'Va ganando Bob el constructor';
    } else if (puntosB > puntosA) {
      return 'Va ganando Paw Patrol';
    } else {
      return 'Empate';
    }
  }

  Color colorEquipoA() {
    if (puntosA > puntosB) {
      return colorVerde;
    }
    return colorOscuro;
  }

  Color colorEquipoB() {
    if (puntosB > puntosA) {
      return colorVerde;
    }
    return colorOscuro;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Marcador Deportivo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 900,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                  

                    const SizedBox(height: 30),

                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 40,
                      runSpacing: 30,
                      children: [
                        // EQUIPO A
                        Container(
                          width: 280,
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black12,
                            ),
                            
                          ),
                          child: Column(
                            children: [
                              Image.network(
                                'https://1000marcas.net/wp-content/uploads/2021/04/Bob-the-Builder-logo.png',
                                width: 140,
                                height: 100,
                                fit: BoxFit.contain,
                                webHtmlElementStrategy:
                                    WebHtmlElementStrategy.fallback,
                                errorBuilder: (
                                  context,
                                  error,
                                  stackTrace,
                                ) {
                                  return const SizedBox(
                                    width: 140,
                                    height: 100,
                                    child: Icon(
                                      Icons.image_not_supported,
                                      size: 60,
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(height: 15),

                              Text(
                                'Bob el constructor',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: colorEquipoA(),
                                ),
                              ),

                              const SizedBox(height: 15),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: colorFondo,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  '$puntosA',
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: colorOscuro,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      if (puntosA > 0) {
                                        setState(() {
                                          puntosA--;
                                        });
                                      }
                                    },
                                    style: OutlinedButton.styleFrom(
                                      minimumSize: const Size(60, 45),
                                    ),
                                    child: const Text(
                                      '-1',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        puntosA++;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(60, 45),
                                      backgroundColor: colorOscuro,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text(
                                      '+1',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // EQUIPO B
                        Container(
                          width: 280,
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black12,
                            ),
                          
                          ),
                          child: Column(
                            children: [
                              Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT834HwFDE2GKd5_XYft0ucRMHsulAT2eQXp1x6gzXt4_q-y4OsVr65w9IP&s=10',
                                width: 140,
                                height: 100,
                                fit: BoxFit.contain,
                                webHtmlElementStrategy:
                                    WebHtmlElementStrategy.fallback,
                                errorBuilder: (
                                  context,
                                  error,
                                  stackTrace,
                                ) {
                                  return const SizedBox(
                                    width: 140,
                                    height: 100,
                                    child: Icon(
                                      Icons.image_not_supported,
                                      size: 60,
                                    ),
                                  );
                                },
                              ),

                              const SizedBox(height: 15),

                              Text(
                                'Paw Patrol',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: colorEquipoB(),
                                ),
                              ),

                              const SizedBox(height: 15),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: colorFondo,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  '$puntosB',
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: colorOscuro,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      if (puntosB > 0) {
                                        setState(() {
                                          puntosB--;
                                        });
                                      }
                                    },
                                    style: OutlinedButton.styleFrom(
                                      minimumSize: const Size(60, 45),
                                    ),
                                    child: const Text(
                                      '-1',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        puntosB++;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(60, 45),
                                      backgroundColor: colorOscuro,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text(
                                      '+1',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      child: Text(
                        obtenerResultado(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: colorOscuro,
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          puntosA = 0;
                          puntosB = 0;
                        });
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reiniciar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorOscuro,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 15,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}