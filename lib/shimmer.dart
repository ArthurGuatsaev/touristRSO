import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() => runApp(const MyShimmerApp());

class MyShimmerApp extends StatelessWidget {
  const MyShimmerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ShimmerTest(),
    );
  }
}

class ShimmerTest extends StatefulWidget {
  const ShimmerTest({super.key});

  @override
  State<ShimmerTest> createState() => _ShimmerTestState();
}

class _ShimmerTestState extends State<ShimmerTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Shimmer.fromColors(
            enabled: true,
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.amber,
              height: 200,
              width: 250,
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: const Text(
              'Shimmer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
