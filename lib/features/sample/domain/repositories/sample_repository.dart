import 'package:dartz/dartz.dart';
import '../../../../core/error_handling/failure.dart';
import '../models/sample_model.dart';
import '../models/sample_list_params.dart';

abstract class SampleRepository {
  Future<Either<Failure, List<SampleModel>>> getSampleList(
      SampleListParams params);
}
