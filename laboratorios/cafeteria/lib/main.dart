import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi pedido',
      home: const PedidoPage(),
    );
  }
}

class PedidoPage extends StatefulWidget {
  const PedidoPage({super.key});

  @override
  State<PedidoPage> createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  int cantidadCafe = 0;
  int cantidadChanwis = 0;
  int cantidadJugo = 0;
  int cantidadHigado = 0;

  double calcularTotal() {
    return (cantidadCafe * 10.00) +
        (cantidadChanwis * 25.00) +
        (cantidadJugo * 12.00) +
        (cantidadHigado * 20.00);
  }

  void vaciarPedido() {
    setState(() {
      cantidadCafe = 0;
      cantidadChanwis = 0;
      cantidadJugo = 0;
      cantidadHigado = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi carrito'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ProductoPedido(
              nombre: 'Café snupi',
              precio: 10.00,
              cantidad: cantidadCafe,
              restar: () {
                if (cantidadCafe > 0) {
                  setState(() {
                    cantidadCafe--;
                  });
                }
              },
              sumar: () {
                setState(() {
                  cantidadCafe++;
                });
              },
            ),

            const Divider(),

            ProductoPedido(
              nombre: 'Chanwis de keso',
              precio: 25.00,
              cantidad: cantidadChanwis,
              restar: () {
                if (cantidadChanwis > 0) {
                  setState(() {
                    cantidadChanwis--;
                  });
                }
              },
              sumar: () {
                setState(() {
                  cantidadChanwis++;
                });
              },
            ),

            const Divider(),

            ProductoPedido(
              nombre: 'Jugo de starbaks',
              precio: 12.00,
              cantidad: cantidadJugo,
              restar: () {
                if (cantidadJugo > 0) {
                  setState(() {
                    cantidadJugo--;
                  });
                }
              },
              sumar: () {
                setState(() {
                  cantidadJugo++;
                });
              },
            ),

            const Divider(),

            ProductoPedido(
              nombre: 'Hígado encebollao',
              precio: 20.00,
              cantidad: cantidadHigado,
              restar: () {
                if (cantidadHigado > 0) {
                  setState(() {
                    cantidadHigado--;
                  });
                }
              },
              sumar: () {
                setState(() {
                  cantidadHigado++;
                });
              },
            ),

            const Spacer(),

            Text(
              'Total: Q${calcularTotal().toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: vaciarPedido,
                child: const Text('Vaciar pedido'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductoPedido extends StatelessWidget {
  final String nombre;
  final double precio;
  final int cantidad;
  final VoidCallback restar;
  final VoidCallback sumar;

  const ProductoPedido({
    super.key,
    required this.nombre,
    required this.precio,
    required this.cantidad,
    required this.restar,
    required this.sumar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nombre,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Q${precio.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          ElevatedButton(
            onPressed: restar,
            child: const Text('-'),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              '$cantidad',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ElevatedButton(
            onPressed: sumar,
            child: const Text('+'),
          ),
        ],
      ),
    );
  }
}