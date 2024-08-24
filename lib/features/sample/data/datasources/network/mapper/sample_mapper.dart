import '../../../../../../core/mapper/mapper.dart';
import '../dto/sample_dto.dart';
import '../../../../domain/models/sample_model.dart';

class SampleMapper extends EntityMapper<SampleDto, SampleModel> {
  @override
  SampleModel mapFromEntity(SampleDto entity) {
    // TODO: implement mapFromEntity
    throw UnimplementedError();
  }

  @override
  SampleDto mapToEntity(SampleModel domainModel) {
    // TODO: implement mapToEntity
    throw UnimplementedError();
  }
}
