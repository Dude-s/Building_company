import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = 'localhost';
  static String user = 'root';
  static String password = '';
  static String db = 'frente_de_obra';
  static int port = 3306;

  Mysql();

  Future<bool> testConnection() async {
    var settings = ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db,
    );

    try {
      var connection = await MySqlConnection.connect(settings);
      await connection.close();
      return true; // La conexión se estableció con éxito
    } catch (e) {
      print('Error de conexión: $e');
      return false; // La conexión falló
    }
  }
}
