import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '../../../../core/error_handling/failure.dart';
import '../../domain/get_sample_list_use_case.dart';
import '../../domain/models/sample_model.dart';
import '../../domain/models/sample_list_params.dart';
import 'status/sample_list_status.dart';

part './sample_state.dart';
part './sample_event.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  int pageNumber = 0;
  int totalPage = 1;
  int pageSize = 30;
  CancelToken cancelToken = CancelToken();

  final List<SampleModel> _sampleList = [];
  final GetSampleListUseCase _getSampleListUseCase;
  SampleBloc(
    this._getSampleListUseCase,
  ) : super(SampleState(sampleListStatus: SampleListInitial())) {
    on<PageToInitialSampleListEvent>((event, emit) {
      pageNumber = 0;
      _sampleList.clear();
    });
    on<GetSampleListEvent>((event, emit) async {
      if (pageNumber > 0) {
        emit(state.copyWith(newSampleListStatus: SampleListLoadingMore()));
      } else {
        emit(state.copyWith(newSampleListStatus: SampleListLoading()));
      }
      cancelToken.cancel(DioException.requestCancelled(
          requestOptions: RequestOptions(), reason: 'new request'));
      await cancelToken.whenCancel;
      if (cancelToken.isCancelled) {
        cancelToken = CancelToken();

        final result = await _getSampleListUseCase(SampleListParams());

        result.fold((failure) {
          _handleFailureResponse(emit, failure);
        }, (success) {
          _handleSuccessResponse(success, emit);
        });
      }
    });
  }
  void _handleFailureResponse(Emitter<SampleState> emit, Failure failure) {
    emit(
        state.copyWith(newSampleListStatus: SampleListError(failure: failure)));
  }

  void _handleSuccessResponse(
      List<SampleModel> success, Emitter<SampleState> emit) {
    if (success.isNotEmpty) {
      pageNumber++;
    }
    _sampleList.addAll(success);
    if (_sampleList.isEmpty) {
      emit(state.copyWith(newSampleListStatus: SampleListEmpty()));
    } else {
      emit(state.copyWith(
        newSampleListStatus: SampleListCompleted(list: _sampleList),
      ));
    }
  }
}
