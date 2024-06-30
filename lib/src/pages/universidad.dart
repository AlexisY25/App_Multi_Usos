import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/university_model.dart';
import '../service/university_service.dart';

class Universidad extends StatefulWidget {
  const Universidad({Key? key}) : super(key: key);

  @override
  State<Universidad> createState() => _UniversidadState();
}

class _UniversidadState extends State<Universidad> {
  final TextEditingController _countryController = TextEditingController();
  List<UniversityModel>? _universities;
  bool _isLoading = false;
  bool _hasError = false;

  void _fetchUniversities() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    UniversityService universityService = UniversityService();
    try {
      List<UniversityModel> result = await universityService.getUniversities(_countryController.text);

      setState(() {
        _isLoading = false;
        _universities = result;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universidades por País'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _countryController,
              decoration: const InputDecoration(
                labelText: 'País',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _fetchUniversities,
              child: const Text('Buscar Universidades'),
            ),
            const SizedBox(height: 16.0),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_hasError)
              const Text('Error al cargar las universidades, intenta de nuevo')
            else if (_universities != null && _universities!.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: _universities!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_universities![index].name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dominio: ${_universities![index].domain}'),
                          InkWell(
                            onTap: () => _launchURL(_universities![index].webPage),
                            child: Text(
                              'Página web: ${_universities![index].webPage}',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            else if (_universities != null && _universities!.isEmpty)
              const Text('No se encontraron universidades para este país.')
            else
              const SizedBox(), // Agrega un SizedBox para evitar errores
          ],
        ),
      ),
    );
  }
}
