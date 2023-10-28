import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Monedas',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Conversor de Monedas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
enum MonedaExtranjera {pesomexicano, pesoargentino, dolaramericano}
class _MyHomePageState extends State<MyHomePage> {

  final _pesocolombiano = TextEditingController();
  double _monedacambiada = 0;
  String _moneda ="";

  void _convertirmoneda(Enum monedaextranjera) {
    setState(() {
      switch(monedaextranjera){
        case MonedaExtranjera.pesomexicano:
          _monedacambiada = int.parse(_pesocolombiano.text) * 0.0044; // el peso mexicano está en 0,0044
          _moneda="peso mexicano";
          break;
        case MonedaExtranjera.pesoargentino:
          _monedacambiada = int.parse(_pesocolombiano.text) * 0.085;// el peso argentino está en 0,085
          _moneda="peso argentino";
          break;
        case MonedaExtranjera.dolaramericano:
          _monedacambiada = int.parse(_pesocolombiano.text) * 0.00024;// el dolar está en 0,00024
          _moneda="dolar";
          break;


      }


    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:Padding(
        padding:const EdgeInsets.symmetric(horizontal: 30,vertical: 0),
        child:Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Ingrese la cantidad en pesos colombianos',
              ),
              TextField(
                controller: _pesocolombiano,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
                  labelText: 'COP',
                  border: OutlineInputBorder(),
                ),
                keyboardType:TextInputType.number,
              ),
              const SizedBox(height: 20),
              Row(children: [
                ElevatedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 10)
                    ),
                    onPressed:(){
                      _convertirmoneda(MonedaExtranjera.pesomexicano);
                    },
                    child: const Text("PESOS MEX")),
                const SizedBox(width: 10),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 10)
                    ),
                    onPressed:(){
                      _convertirmoneda(MonedaExtranjera.pesoargentino);
                    },
                    child: const Text("PESOS ARG")),
                const SizedBox(width: 10),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 10)
                    ),
                    onPressed:(){
                      _convertirmoneda(MonedaExtranjera.dolaramericano);
                    },
                    child: const Text("DOLAR USA")),
              ],),
              Text('La conversión a $_moneda es: ${_monedacambiada.toStringAsFixed(2)}'),
            ],
          ),
        ),
      ),



    );
  }
}
