import 'package:flutter/material.dart';

class SampleListScreen extends StatefulWidget {
  const SampleListScreen({super.key});

  @override
  State<SampleListScreen> createState() => _SampleListScreenState();
}

class _SampleListScreenState extends State<SampleListScreen> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
