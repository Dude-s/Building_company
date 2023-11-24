import 'package:building_company/logic/models/mysql.dart';
import 'package:flutter/material.dart';

void main() async {
  var mysql = Mysql(); // Crear una instancia de la clase Mysql
  bool isConnected = await mysql.testConnection(); // Llamar al método desde la instancia

  if (isConnected) {
    print('La base de datos está conectada');
    runApp(MyApp());
  } else {
    print('No se pudo establecer la conexión a la base de datos');
    // Puedes manejar el caso donde la conexión falla, por ejemplo, mostrando un mensaje o cerrando la aplicación.
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Apps',
      home: Scaffold(
        appBar: AppBar(title: Text('MyApp')),
        body: Center(
          child: Text('MyApp Body'),
        ),
      ),
    );
  }
}


/*import 'package:building_company/pages/login.dart';
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 46, 103, 224),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Building-Company',style: TextStyle(
                    color: Color.fromARGB(255, 3, 39, 70),
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              Image.asset('assets/Logo.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: ()=>{
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login())
                      )
                    },
                     child: Text('Iniciar sesion',style: TextStyle(color: Color.fromARGB(255, 19, 80, 211),fontSize: 20),),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 176, 203, 226),
                      side:BorderSide(color: Color.fromARGB(255, 19, 80, 211),width: 2),
                      padding: 
                        EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                        minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                      )
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}*/