import 'package:flutter/material.dart';

class DetailPage1 extends StatelessWidget {
  const DetailPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Hero(
              tag: 'banner-3',
              child: Image.asset(
                'images/banner 3.png',
                width: 220,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}