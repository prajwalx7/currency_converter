import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 83;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD6DAC8),
      appBar: AppBar(
        title: const Text("Currency Converter"),
        centerTitle: true,
        backgroundColor: const Color(0xffD6DAC8),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'INR ${result != 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 34),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              cursorColor: Colors.black,
              controller: textEditingController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.monetization_on_outlined),
                hintText: "Please enter the amount in USD",
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: convert,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(8),
                      right: Radius.circular(8),
                    ),
                  ),
                  fixedSize: const Size(900, 50)),
              child: const Text("Convert"),
            ),
          ],
        ),
      ),
    );
  }
}
