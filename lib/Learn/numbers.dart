import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class numbers extends StatefulWidget {
  const numbers({Key? key}) : super(key: key);

  @override
  State<numbers> createState() => _numbersState();
}

class _numbersState extends State<numbers> {
  late SharedPreferences _prefs;
  late Map<String, bool> numberStatus = {};

  @override
  void initState() {
    super.initState();
    _initNumberStatus();
  }

  Future<void> _initNumberStatus() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      setState(() {
        numberStatus = Map<String, bool>.from(
          Map.fromIterable(
            List.generate(11, (index) => index.toString()),
            key: (number) => number as String,
            value: (number) => _prefs.getBool(number.toString()) ?? false,
          ),
        );
      });
    } catch (e) {
      print('Error initializing numberStatus: $e');
    }
  }

  void _toggleNumberStatus(String number) async {
    setState(() {
      numberStatus[number] = !numberStatus[number]!;
    });
    await _prefs.setBool(number, numberStatus[number]!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Deaf & Dumb Learning',
          style: TextStyle(fontSize: 25, color: Colors.teal),
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.8 / 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 40,
        ),
        children: numberStatus.keys.map((number) {
          return InkWell(
            onTap: () => _toggleNumberStatus(number),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CustomContainer("assets/Number/$number.jpg", number),
                if (numberStatus[number] == true)
                  Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget CustomContainer(String url, String title) {
    return Container(
      height: 230,
      width: 230,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.black26),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red.shade900,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 120, child: Image.asset(url)),
        ],
      ),
    );
  }
}
