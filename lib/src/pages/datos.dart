import 'package:flutter/material.dart';

class Datos extends StatefulWidget {
  const Datos({super.key});

  @override
  State<Datos> createState() => _DatosState();
}

class _DatosState extends State<Datos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de'),
        backgroundColor: Color.fromARGB(255, 254, 252, 252),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/foto.jpg'), // Asegúrate de tener esta imagen en el directorio assets
            ),
            const SizedBox(height: 20),
            Text(
              'Alexis Yunior Romero Polanco',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Desarrollador de Software',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contacto',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ContactInfoRow(
              icon: Icons.email,
              text: 'alexisy_25@outlook.com',
            ),
            ContactInfoRow(
              icon: Icons.phone,
              text: '829-328-9916',
            ),
            ContactInfoRow(
              icon: Icons.phone,
              text: '809-239-6270',
            ),
          ],
        ),
      ),
    );
  }
}

class ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactInfoRow({required this.icon, required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
