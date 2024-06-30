import 'package:flutter/material.dart';
import '../models/gender_model.dart';
import '../service/gender_service.dart';

class Genero extends StatefulWidget {
  const Genero({super.key});

  @override
  State<Genero> createState() => _GeneroState();
}

class _GeneroState extends State<Genero> {
  final TextEditingController _nameController = TextEditingController();
  String? _gender;
  bool _isLoading = false;

  void _predictGender() async {
    setState(() {
      _isLoading = true;
    });

    GenderService genderService = GenderService();
    GenderModel? result = await genderService.getGender(_nameController.text);

    setState(() {
      _isLoading = false;
      _gender = result?.gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predicción de Género'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _predictGender,
              child: const Text('Predecir Género'),
            ),
            const SizedBox(height: 16.0),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_gender != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                color: _gender == 'male' ? Colors.blue : Colors.pink,
                child: Text(
                  'Género: ${_gender == 'male' ? 'Masculino' : 'Femenino'}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
