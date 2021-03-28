import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String info_text = "Pode Entrar";

  void carregarContador(int incremento) {
    setState(() {
      _pessoa += incremento;
      if (_pessoa <= 10 && _pessoa >= 0) {
        info_text = "Pode Entrar";
      }
      if (_pessoa < 0) {
        info_text = "Mundo Invertido";
      }
      if (_pessoa >= 11) {
        info_text = "Restaurante Cheio";
        _pessoa = 11;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Contador : $_pessoa",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0),
            ),
            // ignore: deprecated_member_use
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child:
                      // ignore: deprecated_member_use
                      FlatButton(
                          onPressed: () {
                            carregarContador(1);
                          },
                          child: Text(
                            "+1",
                            style:
                                TextStyle(fontSize: 40.00, color: Colors.white),
                          )),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child:
                      // ignore: deprecated_member_use
                      FlatButton(
                          onPressed: () {
                            carregarContador(-1);
                          },
                          child: Text(
                            "-1",
                            style:
                                TextStyle(fontSize: 40.00, color: Colors.white),
                          )),
                ),
              ],
            ),
            Text(
              info_text,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.00),
            ),
          ],
        ),
      ],
    );
  }
}
