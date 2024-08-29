import 'package:flutter/material.dart';


class CustomRedirect extends StatelessWidget {
  final String message;
  final String linkText;
  final Widget Navigate;

  CustomRedirect({
    required this.message,
    required this.linkText,
    required this.Navigate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(
              color: Colors.orange,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Navigate),
              );
            },
            child: Text(
              linkText,
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 17
              ),
            ),
          ),
        ],
      ),
    );
  }
}
