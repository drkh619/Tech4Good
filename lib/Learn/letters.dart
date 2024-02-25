import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class letters extends StatefulWidget {
  const letters({Key? key}) : super(key: key);

  @override
  State<letters> createState() => _lettersState();
}

class _lettersState extends State<letters> {
  late SharedPreferences _prefs;
  late Map<String, bool> letterStatus = {}; // Initialize with an empty map

  @override
  void initState() {
    super.initState();
    _initLetterStatus();
  }

  Future<void> _initLetterStatus() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      setState(() {
        letterStatus = Map<String, bool>.from(
          Map.fromIterable(
            ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'],
            key: (letter) => letter as String,
            value: (letter) => _prefs.getBool(letter.toString()) ?? false,
          ),
        );
      });
    } catch (e) {
      print('Error initializing letterStatus: $e');
    }
  }


  void _toggleLetterStatus(String letter) async {
    setState(() {
      letterStatus[letter] = !letterStatus[letter]!;
    });
    await _prefs.setBool(letter, letterStatus[letter]!);
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
        children: letterStatus.keys.map((letter) {
          return InkWell(
            onTap: () => _toggleLetterStatus(letter),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CustomContainer("assets/letters/$letter.jpg", letter),
                if (letterStatus[letter] == true)
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
      width: 180,
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
