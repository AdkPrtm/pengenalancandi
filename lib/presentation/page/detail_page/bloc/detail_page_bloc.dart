import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_page_event.dart';
part 'detail_page_state.dart';

class DetailPageBloc extends Bloc<DetailPageEvent, DetailPageState> {
  DetailPageBloc() : super(const DetailPageInitial()) {
    on<TapedTabbar>((event, emit) {
      emit(DetailPageInitial(
          indexTabbar: event.indexTabbar, indexImage: event.indexImage));
    });
  }
}
