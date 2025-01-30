import 'package:flutter/material.dart';

// class CurrencyConverterMaterialPage extends StatelessWidget {
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
          color: const Color.fromARGB(255, 66, 44, 36),
          width: 2.0,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)));
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 202, 253, 83),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(58, 148, 146, 147),
          title: const Text("USD to INR"),
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
                    hintStyle:
                        const TextStyle(color: Color.fromARGB(255, 12, 35, 46)),
                    prefixIcon: const Icon(Icons.monetization_on),
                    focusedBorder: textfieldborder,
                    enabledBorder: textfieldborder,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                    onPressed: () {
                      debugPrint(textEditingController.text);
                      setState(() {
                        result = double.parse(textEditingController.text) * 81;
                      });
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.brown),
                      fixedSize: WidgetStatePropertyAll(Size(200, 60)),
                    ),
                    child: const Text(
                      "Convert",
                      style: TextStyle(
                          color: Color.fromARGB(255, 238, 233, 232),
                          fontWeight: FontWeight.bold,
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
