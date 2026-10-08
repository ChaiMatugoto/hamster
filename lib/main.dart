import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HamsterGacha()));

class HamsterGacha extends StatefulWidget {
  const HamsterGacha({super.key});
  @override
  State<HamsterGacha> createState() => _HamsterGachaState();
}

class _HamsterGachaState extends State<HamsterGacha> {
  int n = 0, e = 0;
  bool loading = false;
  final emojis = ['☀️', '🌏', '🪐', '🌕'];
  final images = [
    'images/image1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image5.jpg',
    'images/image6.jpg',
    'images/image7.jpg',
    'images/image8.jpg',
    'images/image9.jpg',
  ];
  Future<void> gacha() async {
    setState(() => loading = true);
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      setState(() => e = (e + 1) % emojis.length);
    }
    setState(() {
      n = Random().nextInt(images.length);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(title: const Text('🌏 Random Planet ☀️')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: loading
                ? Center(
                    child: Text(
                      emojis[e],
                      style: const TextStyle(fontSize: 100),
                    ),
                  )
                : Image.network(images[n], fit: BoxFit.cover),
          ),
          const SizedBox(height: 30),
          const Text('🛰️', style: TextStyle(fontSize: 72,color: Colors.blue)),

          ElevatedButton(
            onPressed: loading ? null : gacha,
            child: const Text('ガチャを回す！'),
          ),
        ],
      ),
    ),
  );
}
