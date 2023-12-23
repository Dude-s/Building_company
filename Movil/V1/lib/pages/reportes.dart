import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class Reportes extends StatelessWidget {
  const Reportes({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reportes',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Generar Reporte'),
        ),
        body: ReportForm(),
      ),
    );
  }
}

class ReportForm extends StatefulWidget {
  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  TextEditingController _textController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  List<XFile> _images = [];
  List<TextEditingController> _incidentControllers = [TextEditingController()];

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      setState(() {
        _images.add(pickedImage);
      });
    }
  }

  void _addIncident() {
    setState(() {
      _incidentControllers.add(TextEditingController());
    });
  }

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    XFile? takenImage = await picker.pickImage(source: ImageSource.camera);

    if (takenImage != null) {
      setState(() {
        _images.add(takenImage);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fecha actual:',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _textController,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Escribe tu reporte aquí...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Incidentes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _incidentControllers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: TextFormField(
                    controller: _incidentControllers[index],
                    decoration: InputDecoration(
                      hintText: 'Incidente ${index + 1}',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _addIncident,
              icon: Icon(Icons.add),
              label: Text('Agregar Incidente'),
            ),
            SizedBox(height: 20),
            if (_images.isNotEmpty)
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: _images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(_images[index].path),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            _removeImage(index);
                          },
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _pickImage(ImageSource.gallery);
                  },
                  child: Text('Seleccionar imagen'),
                ),
                ElevatedButton(
                  onPressed: _takePicture,
                  child: Text('Tomar foto'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Enviar Reporte'),
            ),
          ],
        ),
      ),
    );
  }
}