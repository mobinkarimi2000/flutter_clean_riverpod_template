import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/custom_colors.dart';
import '../../../../core/widget/error_handling/error_handling_widget.dart';
import '../../domain/models/sample_model.dart';
import '../bloc/sample_bloc.dart';
import '../bloc/status/sample_list_status.dart';
import 'empty_data_sample_list_widget.dart';
import 'loading_sample_card.dart';
import 'sample_card.dart';
import 'package:scroll_edge_listener/scroll_edge_listener.dart';

class SampleListWidget extends StatefulWidget {
  const SampleListWidget({
    super.key,
    required this.type,
  });
  final int type;
  @override
  State<SampleListWidget> createState() => _SampleListWidgetState();
}

class _SampleListWidgetState extends State<SampleListWidget> {
  late SampleBloc sampleBloc;

  List<SampleModel> list = [];
  @override
  void initState() {
    super.initState();
    onWidgetCreated(context);
  }

  void onWidgetCreated(BuildContext context) {
    sampleBloc = BlocProvider.of<SampleBloc>(context);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      refreshScreen();
    });
  }

  void refreshScreen() {
    callInitialEvent();
    callLoadEvent();
  }

  void callLoadEvent() {
    sampleBloc.add(GetSampleListEvent());
  }

  void callInitialEvent() {
    sampleBloc.add(PageToInitialSampleListEvent());
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = Container();

    return Column(
      children: [
        createList(widget),
      ],
    );
  }

  Expanded createList(Widget widget) {
    return Expanded(
      child: BlocBuilder<SampleBloc, SampleState>(
        builder: (context, state) {
          bool isLoadingMore = false;
          if (state.sampleListStatus is SampleListLoading) {
            widget = _createLoadingWidget();
          } else if (state.sampleListStatus is SampleListEmpty) {
            widget = EmptyDataSampleListWidget(
              onClickListener: () {
                refreshScreen();
              },
            );
          } else if (state.sampleListStatus is SampleListCompleted) {
            final SampleListCompleted completed =
                state.sampleListStatus as SampleListCompleted;
            list = completed.list;
            widget = _createLoadedWidget(list, false);
          } else if (state.sampleListStatus is SampleListLoadingMore) {
            widget = _createLoadedWidget(list, false);
            isLoadingMore = true;
          } else if (state.sampleListStatus is SampleListLoadedMoreError) {
            widget = _createLoadedWidget(list, false);
          } else if (state.sampleListStatus is SampleListError) {
            SampleListError followingListError =
                state.sampleListStatus as SampleListError;
            widget = _createErrorWidget(followingListError);
          }
          // widget = _createLoadingWidget();

          return Column(
            children: [
              Expanded(child: widget),
              Visibility(
                visible: isLoadingMore,
                child: _createLoadMoreIndicator(),
              ),
            ],
          );
        },
      ),
    );
  }

  ErrorHandlingWidget _createErrorWidget(SampleListError listError) {
    return ErrorHandlingWidget(
      listError.failure,
      onClickListener: () {
        refreshScreen();
      },
    );
  }

  _createLoadingWidget() => ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                top: 10, bottom: index == list.length - 1 ? 50 : 10),
            child: const LoadingSampleCard(),
          );
        },
      );

  Widget _createLoadedWidget(List<SampleModel> list, bool isLoading) {
    return ScrollEdgeListener(
      edge: ScrollEdge.end,
      edgeOffset: 30,
      continuous: false,
      debounce: const Duration(milliseconds: 500),
      dispatch: true,
      listener: () {
        if (isLoading) {
          return;
        }
        callLoadEvent();
      },
      child: RefreshIndicator(
        onRefresh: () async {
          refreshScreen();
        },
        backgroundColor: CustomColor.white,
        color: CustomColor.red,
        child: ListView.separated(
          itemCount: list.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.only(bottom: index == list.length - 1 ? 50 : 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SampleCard(
                    sampleModel: list[index],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 20);
          },
        ),
      ),
    );
  }

  _createLoadMoreIndicator() {
    return const CircularProgressIndicator(
      color: CustomColor.green,
    );
  }
}
