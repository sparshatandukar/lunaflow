import 'package:flutter/material.dart';

class navigate extends StatefulWidget {
  const navigate({super.key});

  @override
  State<navigate> createState() => _navigateState();
}

class _navigateState extends State<navigate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFFEFAF5),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(

            child: Image.asset(
              'image/luna.png',
              fit: BoxFit.cover,
            ),
          ),
          ElevatedButton(onPressed: (){}, child:
              Text('Login'),
          )
        ],
      ),
    );
  }
}
