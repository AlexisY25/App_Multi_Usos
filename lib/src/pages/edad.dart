import 'package:flutter/material.dart';
import '../models/age_model.dart';
import '../service/age_service.dart';

class Edad extends StatefulWidget {
  const Edad({super.key});

  @override
  State<Edad> createState() => _EdadState();
}

class _EdadState extends State<Edad> {
  final TextEditingController _nameController = TextEditingController();
  int? _age;
  String? _status;
  String? _imageUrl;
  bool _isLoading = false;

  void _predictAge() async {
    setState(() {
      _isLoading = true;
    });

    AgeService ageService = AgeService();
    AgeModel? result = await ageService.getAge(_nameController.text);

    setState(() {
      _isLoading = false;
      if (result != null) {
        _age = result.age;
        if (_age! <= 18) {
          _status = 'Joven';
          _imageUrl = 'assets/Joven.jpg'; 
        } else if (_age! <= 60) {
          _status = 'Adulto';
          _imageUrl = 'assets/Adulto.jpg'; 
        } else {
          _status = 'Anciano';
          _imageUrl = 'assets/Anciano.jpg'; 
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Predicción de Edad'),
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
              onPressed: _predictAge,
              child: const Text('Predecir Edad'),
            ),
            const SizedBox(height: 16.0),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_age != null)
              Column(
                children: <Widget>[
                  Text(
                    'Edad: $_age',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Estado: $_status',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  _imageUrl != null
                      ? Image.asset(
                          _imageUrl!,
                          height: 200,
                          width: 200,
                        )
                      : Container(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
