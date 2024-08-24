import 'package:dartz/dartz.dart';

import '../../../core/error_handling/failure.dart';
import '../../../core/usecase/use_case.dart';
import 'models/sample_list_params.dart';
import 'models/sample_model.dart';
import 'repositories/sample_repository.dart';

class GetSampleListUseCase
    extends UseCase<Either<Failure, List<SampleModel>>, SampleListParams> {
  final SampleRepository _sampleRepository;

  GetSampleListUseCase(this._sampleRepository);
  @override
  Future<Either<Failure, List<SampleModel>>> call(SampleListParams input) {
    return _sampleRepository.getSampleList(input);
  }
}
