import '../dto/sample_dto.dart';
import '../../../../domain/models/sample_list_params.dart';

abstract class SampleDataSource {
  Future<List<SampleDto>> getSampleList(SampleListParams params);
}
