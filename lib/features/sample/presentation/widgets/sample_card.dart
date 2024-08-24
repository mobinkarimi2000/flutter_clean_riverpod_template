import 'package:flutter/material.dart';
import '../../domain/models/sample_model.dart';

class SampleCard extends StatefulWidget {
  const SampleCard({
    super.key,
    required this.sampleModel,
  });
  final SampleModel sampleModel;
  @override
  State<SampleCard> createState() => _SampleCardState();
}

class _SampleCardState extends State<SampleCard> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
