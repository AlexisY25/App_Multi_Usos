import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido a mi app Couteau'),
      ),
      backgroundColor: Colors.white, // Fondo blanco
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Contenedor con imagen centrada y texto debajo
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.grey[200], // Color de fondo del contenedor
                borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/fondo_herramientas.jpeg',
                    fit: BoxFit.cover,
                    width: 300, // Ancho de la imagen dentro del contenedor
                    height: 300, // Alto de la imagen dentro del contenedor
                  ),
                  SizedBox(height: 10.0), // Espacio entre la imagen y el texto
                  Text(
                    'Bienvenidos a mi app',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
