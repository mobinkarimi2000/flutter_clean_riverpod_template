part of 'sample_bloc.dart';

class SampleState {
  final SampleListStatus sampleListStatus;

  SampleState({required this.sampleListStatus});

  SampleState copyWith({SampleListStatus? newSampleListStatus}) {
    return SampleState(
        sampleListStatus: newSampleListStatus ?? sampleListStatus);
  }
}
