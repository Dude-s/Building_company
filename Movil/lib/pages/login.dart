import 'package:building_company/pages/projects.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

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
                    onPressed: ()=>{
                      
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProjectsPage())
                      ),
                      // Lógica de inicio de sesión
                      print('Iniciar sesión')
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
