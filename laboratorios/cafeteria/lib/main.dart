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
              cantidad: 0,
              restar: () {},
              sumar: () {},
            ),

            const Divider(),

            ProductoPedido(
              nombre: 'Chanwis de keso',
              precio: 25.00,
              cantidad: 0,
              restar: () {},
              sumar: () {},
            ),

            const Divider(),

            ProductoPedido(
              nombre: 'Jugo de starbaks',
              precio: 12.00,
              cantidad: 0,
              restar: () {},
              sumar: () {},
            ),
            const Divider(),
             ProductoPedido(
              nombre: 'Hígado encebollao',
              precio: 20.00,
              cantidad: 0,
              restar: () {},
              sumar: () {},
            ),
          

            const Spacer(),

            const Text(
              'Total: Q0.00',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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