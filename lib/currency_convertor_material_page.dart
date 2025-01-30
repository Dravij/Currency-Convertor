import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  @override
  void initState() {
    super.initState();
    debugPrint("rebuilt");
  }

  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    debugPrint("Build called");

    final textfieldborder = OutlineInputBorder(
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 0, 123, 255), // Updated border color
          width: 2.0,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)));
    return Scaffold(
        backgroundColor: Colors.black87, // Background color set to black
        appBar: AppBar(
          elevation: 0,
          backgroundColor:
              const Color.fromARGB(255, 0, 102, 204), // Darker blue
          title: const Text("Currency Convertor"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Text(
                  'INR ${result.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color:
                        const Color.fromARGB(255, 255, 255, 255), // White text
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: "Please enter the amount in USD",
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(
                            255, 255, 255, 255)), // White hint text
                    prefixIcon: const Icon(Icons.monetization_on,
                        color: Color.fromARGB(255, 0, 102, 204)), // Icon color
                    focusedBorder: textfieldborder,
                    enabledBorder: textfieldborder,
                  ),
                  style:
                      const TextStyle(color: Colors.white), // White input text
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      debugPrint(textEditingController.text);
                      setState(() {
                        result = double.parse(textEditingController.text) * 81;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.white, // Button background color white
                      fixedSize: const Size(200, 60),
                      elevation: 10,
                      
                      shadowColor: Colors.blueGrey,
                      textStyle: const TextStyle(
                        color: Colors.black, // Black button text
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    child: const Text(
                      "Convert",
                      style: TextStyle(
                          color: Colors.black, // Black text
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 2),
                    )),
              )
            ],
          ),
        ));
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
