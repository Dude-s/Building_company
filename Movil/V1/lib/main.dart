import 'dart:convert';
import 'package:building_company/pages/navigator.dart';
import 'package:building_company/pages/prueba.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() => runApp(MyApp());

String username = '';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Apps',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext) => const Login(),
      },
    );
  }

}


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;


  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  String msg = '';

  Future<void> login() async { 
  final response = await http.post(
    Uri.parse("http://192.168.1.69/frente_de_obra/login.php"),
    body: {
      "username": controllerUser.text,
      "password": controllerPass.text,
    },
  );


  if (response.statusCode == 200) {
    // La conexión fue exitosa, puedes procesar la respuesta aquí
    print(response.body);
    var datauser = json.decode(response.body);
    print(datauser);
    //print(datauser[0].keys);
    //print(datauser[0]["id_Empleado"]);
    if (datauser.isEmpty) {
      setState(() {
        /*msg = "Usuario o contraseña incorrecta";*/


        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
          content: Text('Usuario o contraseña incorrecta',style: TextStyle(color: Colors.red),),
          duration: Duration(seconds: 3), // Puedes ajustar la duración del mensaje
        ),
  );
      });
    } else {
      //Navigation();
      if (datauser[0]['id_Empleado'] == '1') {
        Navigator.push(
          context,
            MaterialPageRoute(builder: (context) => prueba()),
        );
      } else if (datauser[0]['id_Empleado'] == '2') {
        Navigator.push(
          context,
            MaterialPageRoute(builder: (context) => Navigation()),
        );
      }

      /*setState(() {
        username = datauser[0]['id_Empleado'];
      });*/
    }
  } else {
    // Hubo un problema de conexión, puedes manejarlo aquí
    // Por ejemplo, mostrar un mensaje de error
    print('Error en la conexión: ${response.statusCode}');
  }
}





  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFF2196f3),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: _animation.value,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Text('Building-Company',style: TextStyle(
                    color: Color(0xFF003785),
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
                  Image.asset('assets/Logo.png',
                    width: 200,
                    height: 200,
                    ),
                  TextFormField(
                    controller: controllerUser,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0), // Radio de borde del campo de texto
                        borderSide: BorderSide(width: 2.0, color: const Color.fromARGB(255, 0, 0, 0)), // Grosor y color del borde cuando no está enfocado
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0), // Radio de borde del campo de texto cuando está enfocado
                        borderSide: BorderSide(width: 2.0, color: const Color.fromARGB(255, 0, 0, 0)), // Grosor y color del borde cuando está enfocado
                      ),
                      filled: true,
                      fillColor: Colors.white
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: controllerPass,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0), // Radio de borde del campo de texto
                        borderSide: BorderSide(width: 2.0, color: const Color.fromARGB(255, 0, 0, 0)), // Grosor y color del borde cuando no está enfocado
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0), // Radio de borde del campo de texto cuando está enfocado
                        borderSide: BorderSide(width: 2.0, color: const Color.fromARGB(255, 0, 0, 0)), // Grosor y color del borde cuando está enfocado
                      ),
                      filled: true,
                      fillColor: Colors.white
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      login();
                      print('Iniciar sesión');
                    },
                    child: Text('Iniciar sesión'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF003785),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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